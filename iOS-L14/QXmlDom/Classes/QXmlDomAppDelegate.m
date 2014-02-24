//
//  QXmlDomAppDelegate.m
//  QXmlDom
//
//  Created by qin jie on 11-2-28.
//  Copyright 2011 ldci. All rights reserved.
//

#import "QXmlDomAppDelegate.h"
#import "GDataXMLNode.h"


@implementation QXmlDomAppDelegate

@synthesize window;
@synthesize btnXmlParseOfDOM;
@synthesize btnXmlParseOfSAX;
@synthesize txtResultView;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.	
	
    [window makeKeyAndVisible];
    
    return YES;
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
	
	NSLog(@"applicationDidEnterBackground:");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
	NSLog(@"applicationWillEnterForeground:" );
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
    NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"QXmlDom" ofType:@"momd"];
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
    
    NSURL *storeURL = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"QXmlDom.sqlite"]];
    
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

- (IBAction)btnClickXMLParseOfDOM:(id)sender {
	
	NSError* error = nil;
	NSString *documentStr = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"xml"];
	NSString *docXML = [NSString stringWithContentsOfFile:documentStr];
	GDataXMLDocument* XMLdocument = [[GDataXMLDocument alloc] initWithXMLString:docXML options:0 error:&error];
	GDataXMLElement* rootElement = [XMLdocument rootElement];
	NSArray *businesses2 = [rootElement elementsForName:@"student"];
	
	NSMutableString *str = [[NSMutableString alloc] init];
	[str appendFormat:@"开始解析 xml of DOM 文件\r\n"];
	for (int i=0; i<businesses2.count; i++) {
		GDataXMLNode *node = [businesses2 objectAtIndex:i];
		[str appendFormat:@"************student************\r\n"];
		for (int k=0; k<[node childCount]; k++) {
			GDataXMLNode *sub_node = [node childAtIndex:k]; 
			switch (k) {
				case 0:
					[str appendFormat:@"stu_num=%@\r\n", [sub_node stringValue]]; 
					break;
				case 1:
					[str appendFormat:@"stu_name=%@\r\n", [sub_node stringValue]]; 
					break;
				case 2:
					[str appendFormat:@"stu_class=%@\r\n", [sub_node stringValue]]; 
					break;
				default:
					break;
			}
			//NSLog(@"con=%@",[sub_node stringValue]);
		}
	}
	[str appendFormat:@"************student************\r\n"];
	[str appendFormat:@"解析 xml 文件完成"];
	[txtResultView setText:str];
	
	[str release];
}

- (IBAction)btnClickXMLParseOfSAX:(id)sender {
	NSString* path = path = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"xml"]; 
	NSFileHandle* file = [NSFileHandle fileHandleForReadingAtPath:path]; 
	NSData* data = [file readDataToEndOfFile]; 
	[file closeFile];
		
	xmlParse = [[NSXMLParser alloc] initWithData:data];
	//设置该类本身为代理类 
	[xmlParse setDelegate:self];
	
	strSaxResult = [[NSMutableString alloc] init];
	strTmpSax = [[NSMutableString alloc] init];
	BOOL flag = [xmlParse parse]; 
	if (flag) { 
		[strSaxResult appendFormat:@"%@\r\n",@"获取指定路径的 xml 文件成功"]; 
	} else {
		[strSaxResult appendFormat:@"%@\r\n",@"获取指定路径的 xml 文件失败"]; 
	}
	[xmlParse release];
	//[strSaxResult appendFormat:@"%@\r\n", @""];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser { 
	NSLog(@"开始解析 xml 文件"); 
	[strSaxResult appendFormat:@"%@\r\n", @"开始解析 xml of SAX 文件"];
	[strSaxResult appendFormat:@"%@\r\n", @"**********student**********"];
}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	if (string == nil) {
		NSLog(@"empty data");
	}
	else {
		NSLog(@"11 %@", string);
		
		[strTmpSax setString:@""];
		[strTmpSax appendFormat:@"%@", string];
	}
}

-(void)parser:(NSXMLParser	*)parser	
didEndElement:(NSString	*)elementName 
 namespaceURI:(NSString *)namespaceURI 
qualifiedName:(NSString *)qName {
	
	NSLog(@"%@ = %@", strTmpSax, elementName);
	
	if (NSOrderedSame == [elementName compare:@"student"]) {
		[strSaxResult appendFormat:@"%@\r\n", @"**********student**********"];
	} else if (NSOrderedSame == [elementName compare:@"student_list"]) {
		
	} else {
		[strSaxResult appendFormat:@"%@ = %@\r\n", elementName, strTmpSax];
	}
}

- (void)parserDidEndDocument:(NSXMLParser *)parser { 
	NSLog(@"解析 xml 文件完成"); 
	[strSaxResult appendFormat:@"%@", @"解析 xml 文件完成"];
	
	[txtResultView setText:strSaxResult];
	[strTmpSax release];
	[strSaxResult release];
	//[strTmpSax release];
}


- (void)dealloc {
    
    [managedObjectContext_ release];
    [managedObjectModel_ release];
    [persistentStoreCoordinator_ release];
    
    [window release];
    [super dealloc];
}


@end

