//
//  NoteSectionAppDelegate.m
//  NoteSection
//
//  Created by han-yuantao on 12/7/09.
//  Copyright sdie 2009. All rights reserved.
//

#import "NoteSectionAppDelegate.h"
#import "NoteSectionViewController.h"

@implementation NoteSectionAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
