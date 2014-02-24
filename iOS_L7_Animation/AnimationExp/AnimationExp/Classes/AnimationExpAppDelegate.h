//
//  AnimationExpAppDelegate.h
//  AnimationExp
//
//  Created by liduan on 11-3-22.
//  Copyright 2011 HitMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnimationExpViewController;

@interface AnimationExpAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AnimationExpViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AnimationExpViewController *viewController;

@end

