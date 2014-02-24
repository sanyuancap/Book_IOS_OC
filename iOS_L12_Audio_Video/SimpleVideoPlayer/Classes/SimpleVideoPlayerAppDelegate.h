//
//  SimpleVideoPlayerAppDelegate.h
//  SimpleVideoPlayer
//
//  Created by liduan on 11-4-1.
//  Copyright 2011 HitMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleVideoPlayerViewController;

@interface SimpleVideoPlayerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SimpleVideoPlayerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SimpleVideoPlayerViewController *viewController;

@end

