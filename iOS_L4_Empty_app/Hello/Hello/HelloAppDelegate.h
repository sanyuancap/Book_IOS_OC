//
//  HelloAppDelegate.h
//  Hello
//
//  Created by goodmao on 12-8-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//包含头文件
#import "HelloViewController.h"

@interface HelloAppDelegate : UIResponder <UIApplicationDelegate>
//{
//    HelloViewController *m_pHelloVC;
//}

//声明属性
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HelloViewController *m_pHelloVC;

@end




