//
//  NavAppDelegate.h
//  Nav
//
//  Created by goodmao on 12-8-22.
//  Copyright (c) 2012年 LDCI. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "common.h"

@interface NavAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *m_pNavController;
@property (strong, nonatomic) UIViewController *m_pVC1;
@property (strong, nonatomic) UIViewController *m_pVC2;
@property (strong, nonatomic) UIViewController *m_pVC3;


- (void) buttonPressedToVC2;
- (void) buttonPressedBackToVC1;


@end
