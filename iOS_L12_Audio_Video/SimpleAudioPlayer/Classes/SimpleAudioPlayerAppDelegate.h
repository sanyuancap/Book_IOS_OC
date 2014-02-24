//
//  SimpleAudioPlayerAppDelegate.h
//  SimpleAudioPlayer
//
//  Created by liduan on 11-4-2.
//  Copyright 2011 HitMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleAudioPlayerViewController;

@interface SimpleAudioPlayerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SimpleAudioPlayerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SimpleAudioPlayerViewController *viewController;

@end

