//
//  GPSAppDelegate.h
//  GPS
//
//  Created by Ma Genius on 11-2-17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPSViewController;

@interface GPSAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GPSViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GPSViewController *viewController;

@end

