//
//  QCoreDataAppDelegate.m
//  QCoreData
//
//  Created by LDCI on 11-1-24.
//  Copyright 2011 ldci. All rights reserved.
//

#import "QCoreDataAppDelegate.h"
#import "FailedBankInfo.h"
#import "FailedBankDetails.h"


@implementation QCoreDataAppDelegate

@synthesize window;
@synthesize btnSave1;
@synthesize btnSave2;
@synthesize btnRead1;
@synthesize btnRead2;
@synthesize txtView;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
 	
    [window makeKeyAndVisible];
    
    return YES;
}

- (IBAction)btnClickedSave1:(id)sender {
	// Override point for customization after application launch.
    NSManagedObjectContext *context = [self managedObjectContext];
	NSManagedObject *failedBankInfo = [NSEntityDescription
									   insertNewObjectForEntityForName:@"FailedBankInfo"
									   inManagedObjectContext:context];
	[failedBankInfo setValue:@"1" forKey:@"name"];
	[failedBankInfo setValue:@"1" forKey:@"city"];
	[failedBankInfo setValue:@"1" forKey:@"state"];
	
	NSManagedObject *failedBankDetails = [NSEntityDescription
										  insertNewObjectForEntityForName:@"FailedBankDetails"
										  inManagedObjectContext:context];
	[failedBankDetails setValue:[NSDate date] forKey:@"closeDate"];
	[failedBankDetails setValue:[NSDate date] forKey:@"updateDate"];
	[failedBankDetails setValue:[NSNumber numberWithInt:12345] forKey:@"zip"];
	[failedBankDetails setValue:failedBankInfo forKey:@"info"];
	[failedBankInfo setValue:failedBankDetails forKey:@"details"];
	
	NSError *error;
	if (![context save:&error]) {
		NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
	}	
}

- (IBAction)btnClickedRead1:(id)sender {
	NSError *error;
	NSManagedObjectContext *context = [self managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription
								   entityForName:@"FailedBankInfo" inManagedObjectContext:context];
	[fetchRequest setEntity:entity];
	
	NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
	NSMutableString *str = [[NSMutableString alloc] init];
	for (NSManagedObject *info in fetchedObjects)
	{
		//NSLog(@"Name: %@", [info valueForKey:@"name"]);
		[str appendFormat:@"\r\n %@", [info valueForKey:@"name"]];
		NSManagedObject *details = [info valueForKey:@"details"];
		//NSLog(@"Zip: %@", [details valueForKey:@"zip"]);
		[str appendFormat:@" %@", [details valueForKey:@"zip"]];
	}
	[fetchRequest release];	
	[txtView setText:str];
	[str release];
}

- (IBAction)btnClickedSave2:(id)sender {
	NSManagedObjectContext *context = [self managedObjectContext];
	FailedBankInfo *failedBankInfo = [NSEntityDescription
									  insertNewObjectForEntityForName:@"FailedBankInfo"
									  inManagedObjectContext:context];
	failedBankInfo.name = @"2";
	failedBankInfo.city = @"2";
	failedBankInfo.state = @"2";
	FailedBankDetails *failedBankDetails = [NSEntityDescription
											insertNewObjectForEntityForName:@"FailedBankDetails"
											inManagedObjectContext:context];
	failedBankDetails.closeDate = [NSDate date];
	failedBankDetails.updateDate = [NSDate date];
	failedBankDetails.zip = [NSNumber numberWithInt:12345];
	failedBankDetails.info = failedBankInfo;
	failedBankInfo.details = failedBankDetails;
	NSError *error;
	if (![context save:&error]) {
		NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
	}
}


- (IBAction)btnClickedRead2:(id)sender {
	NSError *error;
	NSManagedObjectContext *context = [self managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"FailedBankInfo"
											  inManagedObjectContext:context];
	[fetchRequest setEntity:entity];
	
	NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
	NSMutableString *str = [[NSMutableString alloc] init];
	for (NSManagedObject *info in fetchedObjects) {
		//NSLog(@"Name: %@", [info valueForKey:@"name"]);
		[str appendFormat:@"\r\n %@", [info valueForKey:@"name"]];
		NSManagedObject *details = [info valueForKey:@"details"];
		//NSLog(@"Zip: %@", [details valueForKey:@"zip"]);
		[str appendFormat:@" %@", [details valueForKey:@"zip"]];
	}
	[fetchRequest release];	
	[txtView setText:str];
	[str release];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
    [self saveContext];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}


- (void)saveContext {
    
    NSError *error = nil;
    if (managedObjectContext_ != nil) {
        if ([managedObjectContext_ hasChanges] && ![managedObjectContext_ save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}    


#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext {
    
    if (managedObjectContext_ != nil) {
        return managedObjectContext_;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext_ = [[NSManagedObjectContext alloc] init];
        [managedObjectContext_ setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext_;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel {
    
    if (managedObjectModel_ != nil) {
        return managedObjectModel_;
    }
    NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"QCoreData" ofType:@"momd"];
    NSURL *modelURL = [NSURL fileURLWithPath:modelPath];
    managedObjectModel_ = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return managedObjectModel_;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator_ != nil) {
        return persistentStoreCoordinator_;
    }
    
    NSURL *storeURL = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"QCoreData.sqlite"]];
    
    NSError *error = nil;
    persistentStoreCoordinator_ = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator_ addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return persistentStoreCoordinator_;
}


#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the path to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    
    [managedObjectContext_ release];
    [managedObjectModel_ release];
    [persistentStoreCoordinator_ release];
    
    [window release];
    [super dealloc];
}


@end

