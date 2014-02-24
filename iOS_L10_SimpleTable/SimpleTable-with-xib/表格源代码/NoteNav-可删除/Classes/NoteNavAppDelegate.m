//
//  NoteNavAppDelegate.m
//  NoteNav
//
//  Created by mingchun liu on 12/10/09.
//  Copyright sdie 2009. All rights reserved.
//

#import "NoteNavAppDelegate.h"
#import "RootViewController.h"


@implementation NoteNavAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

