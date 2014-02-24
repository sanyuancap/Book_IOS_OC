//
//  AccelerometerAppDelegate.h
//  Accelerometer
//
//  Created by Ma Genius on 11-2-17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccelerometerViewController;

@interface AccelerometerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AccelerometerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AccelerometerViewController *viewController;

@end

