//
//  QSqliteAppDelegate.m
//  QSqlite
//
//  Created by LDCI on 11-1-24.
//  Copyright 2011 ldci. All rights reserved.
//

#import "QSqliteAppDelegate.h"

@implementation QSqliteAppDelegate

@synthesize window;
@synthesize edtName;
@synthesize edtAge;
@synthesize edtAddr;
@synthesize edtSex;
@synthesize btnSave;
@synthesize btnRead;
@synthesize txtView;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	
    memberDao = [[MemberDao alloc] init];
    [memberDao initDatabase:@"member.db"];

    [window makeKeyAndVisible];
    
    return YES;
}

- (IBAction)btnClickedRead:(id)sender
{
    NSMutableString *str = [[NSMutableString alloc] init];
    //[liteDB getChannels:str];
    NSMutableArray *allStudent = [memberDao getAllDatas];
    
    for (int i = 0; i<[allStudent count]; i++) {
        NSMutableDictionary *curr = [allStudent objectAtIndex:i];
        [str appendString: [curr objectForKey:@"name"]];
        [str appendString: @"\t"];
        [str appendString: [NSString stringWithFormat:@"%d",[curr objectForKey:@"age"]]];
        [str appendString: @"\t"];
        [str appendString: [curr objectForKey:@"addr"]];
        [str appendString: @"\t"];
        [str appendString: [curr objectForKey:@"sex"]];
        [str appendString: @"\n"];
    }
    
    
    [txtView setText:str];
    NSLog(@"%@",str);
    
    [str setString:@""];
    
    NSMutableArray *oneStudents = [memberDao getStudentsByName:@"h"];
    
    for (int i = 0; i<[oneStudents count]; i++) {
        NSMutableDictionary *curr = [allStudent objectAtIndex:i];
        [str appendString: [curr objectForKey:@"name"]];
        [str appendString: @"\t"];
        [str appendString: [NSString stringWithFormat:@"%d",[curr objectForKey:@"age"]]];
        [str appendString: @"\t"];
        [str appendString: [curr objectForKey:@"addr"]];
        [str appendString: @"\t"];
        [str appendString: [curr objectForKey:@"sex"]];
        [str appendString: @"\n"];
    }
    
    NSLog(@"search:%@",str);

    
    [str release];
    
    
    
}

- (IBAction)btnClickedSave:(id)sende
{
    NSString *name = [edtName text];
    int nAge = [[edtAge text] intValue];
    NSString *addr = [edtAddr text];
    NSString *sex = [edtSex text];
    [memberDao insertOneChannel:name cage:nAge caddress:addr csex:sex];

//	[liteDB insertOneChannel:@"1" cage:1 caddress:@"1" csex:@"mm"];
//	[liteDB insertOneChannel:@"2" cage:2 caddress:@"2" csex:@"mm"];
//	[liteDB insertOneChannel:@"3" cage:3 caddress:@"3" csex:@"mm"];
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
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [memberDao release];
    [super dealloc];
}


@end