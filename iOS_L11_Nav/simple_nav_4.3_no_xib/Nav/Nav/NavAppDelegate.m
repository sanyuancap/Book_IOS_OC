//
//  NavAppDelegate.m
//  Nav
//
//  Created by goodmao on 12-8-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NavAppDelegate.h"

/*
 本地视图.navigationItem.leftBarButtonItem //左边栏项目
 本地视图.navigationItem.rightBarButtonItem //右边栏项目
 本地视图.navigationItem.backBarButtonItem //后退栏项目
 本地视图.navigationItem.hidesBackButton //隐藏后退按钮（YES or NO）
 
 
 pushViewController:viewController animated:BOOL
 
 （加载视图控制器）
 – 添加指定的视图控制器并予以显示，后接：是否动画显示
 
 popViewControllerAnimated:BOOL
 
 （弹出当前视图控制器）
 – 弹出并向左显示前一个视图
 
 popToViewController:viewController animated:BOOL
 （弹出到指定视图控制器）
 – 回到指定视图控制器， 也就是不只弹出一个
 
 popToRootViewControllerAnimated:BOOL
 （弹出到根视图控制器）
 – 比如说你有一个“Home”键，也许就会实施这个方法了。
 
 setNavigationBarHidden:BOOL animated:BOOL
 （设置导航栏是否显示）
 – 如果你想隐藏导航栏，这就是地方了。参照Picasa的WebApp样式 
 */


@implementation NavAppDelegate

@synthesize window = _window;

@synthesize m_pNavController = _m_pNavController;
@synthesize m_pVC1 = _m_pVC1;
@synthesize m_pVC2 = _m_pVC2;
@synthesize m_pVC3 = _m_pVC3;

#pragma mark -
#pragma mark Button

//=======================================================================
// 第一个界面的按钮响应方法
// 切换到第二个界面
//=======================================================================

- (void) buttonPressedToVC2
{
    __goodmao_Log(@"change to ViewController 2");
    
    //[self.iNavController popToViewController:self.iVC1 animated:YES];
    [self.m_pNavController pushViewController:self.m_pVC2 animated:YES];
}

//=======================================================================
// 第二个界面的按钮响应方法
// 切换到第三个界面
//=======================================================================

- (void) buttonPressedToVC3
{
    __goodmao_Log(@"change to ViewController 3");
    
    [self.m_pNavController pushViewController:self.m_pVC3 animated:YES];
}

//=======================================================================
// 第二个界面的返回按钮响应方法
// 返回到第一个界面
//=======================================================================

- (void) buttonPressedBackToVC1
{
    __goodmao_Log(@"back to VC1");
    
    //[self.iNavController popToViewController:self.iVC2 animated:YES];
    
    // 弹栈，直到仅仅只有一个视图控制器留在导航控制器的栈上为止。该方法，返回弹出栈的所有视图控制器，存放在返回值(NSArray *)中。
    // Pops until there's only a single view controller left on the stack. Returns the popped controllers.
    //[self.iNavController popToRootViewControllerAnimated:YES];
    // or
    //（弹出到指定视图控制器）– 回到指定视图控制器， 也就是不只弹出一个
    [self.m_pNavController popToViewController:self.m_pVC1 animated:YES];
}

//=======================================================================
// 第三个界面的返回按钮响应方法
// 返回到第二个界面
//=======================================================================

- (void) buttonPressedBackToVC2
{
    __goodmao_Log(@"back to VC2");
    
    //（弹出到指定视图控制器）– 回到指定视图控制器， 也就是不只弹出一个
    // Pops view controllers until the one specified is on top. Returns the popped controllers.
    [self.m_pNavController popToViewController:self.m_pVC2 animated:YES];
}

#pragma mark -


#pragma mark -
#pragma mark Create ViewController

//=======================================================================
// 创建第一个视图控制器
// 给第一个视图控制器的view上，添加一个按钮，点击后可以切换到第二个视图控制器的view
//=======================================================================

- (void)createViewControllerFirst
{
    // 创建按钮
    UIButton *pButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pButton1 setFrame: CGRectMake(10, 100, 100, 30)];
    [pButton1 setTitle:@"press" forState:UIControlStateNormal];
    [pButton1 addTarget:self action:@selector(buttonPressedToVC2) forControlEvents:UIControlEventTouchUpInside];
    
    // 创建视图控制器
    self.m_pVC1 = [[UIViewController alloc] init];
    self.m_pVC1.title = @"vc 111";
    self.m_pVC1.view.backgroundColor = [UIColor greenColor];
    
    // 将按钮添加到该视图控制器的视图中
    [self.m_pVC1.view addSubview:pButton1];
    
    // 给第一个视图控制器的导航栏上，添加一个右导航按钮    
    UIBarButtonItem *pBarButtonTtem = [[UIBarButtonItem alloc]
                                       initWithTitle:@"To VC2"
                                       style:UIBarButtonItemStyleBordered
                                       target:self
                                       action:@selector(buttonPressedToVC2)];
    
    pBarButtonTtem.enabled = YES; // 可以关闭或者打开该按钮的显示
    self.m_pVC1.navigationItem.rightBarButtonItem = pBarButtonTtem;
    
    
    //==========================
    
    // 创建导航控制器，并添加第一个视图控制器到该导航控制器上
    // 注意：这种方式，将导航控制器添加到window窗口，则每个视图控制器的界面，都会显示该导航控制器；
    // 但，导航条上的内容，可以由每个视图控制器显各自决定和修改。
    //UINavigationController *
    self.m_pNavController = [[UINavigationController alloc] initWithRootViewController:self.m_pVC1];
    // or
    //self.m_pNavController = [[UINavigationController alloc] init];
    //[self.m_pNavController pushViewController:iVC1 animated:YES];
    
    [self.window addSubview:self.m_pNavController.view];
}

//=======================================================================
// 创建第二个视图控制器
//=======================================================================

- (void)createViewControllerSecond
{
    self.m_pVC2 = [[UIViewController alloc] init];
    self.m_pVC2.title = @"vc 222";
    
    // 给第二个视图控制器的view上，添加一个返回按钮
    UIButton *pButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pButton2 setFrame: CGRectMake(10, 100, 100, 30)];
    [pButton2 setTitle:@"Back to VC1" forState:UIControlStateNormal];
    [pButton2 addTarget:self action:@selector(buttonPressedBackToVC1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.m_pVC2.view addSubview:pButton2];
    
    // 给第二个视图控制器的导航栏上，添加一个右导航按钮
    //创建导航按钮
    UIBarButtonItem *pBarButtonTtem = [[UIBarButtonItem alloc]
                                   initWithTitle:@"To VC3"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(buttonPressedToVC3)];
    //将导航按钮放到导航栏右边
    self.m_pVC2.navigationItem.rightBarButtonItem = pBarButtonTtem;
    [pBarButtonTtem release]; //由于本地视图会retain它，所以我们可以release了
}

//=======================================================================
// 创建第三个视图控制器
//=======================================================================

- (void)createViewControllerThird
{
    self.m_pVC3 = [[UIViewController alloc] init];
    self.m_pVC3.title = @"vc 333";
    
    // 给第三个视图控制器的view上，添加一个返回按钮
    UIButton *pButton3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pButton3 setFrame: CGRectMake(10, 100, 100, 30)];
    [pButton3 setTitle:@"Back to VC2" forState:UIControlStateNormal];
    [pButton3 addTarget:self action:@selector(buttonPressedBackToVC2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.m_pVC3.view addSubview:pButton3];
}


#pragma mark -

- (void)dealloc
{
    [_m_pVC1 release];
    [_m_pVC2 release];
    [_m_pVC3 release];
    
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    [self createViewControllerFirst];
    [self createViewControllerSecond];
    [self createViewControllerThird];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
