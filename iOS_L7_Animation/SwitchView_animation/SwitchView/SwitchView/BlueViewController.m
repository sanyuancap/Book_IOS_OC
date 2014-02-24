//
//  BlueViewController.m
//  SwitchView
//
//  Created by goodmao on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BlueViewController.h"
#import "SwitchViewAppDelegate.h"
#import "SwitchViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

//@synthesize m_pSVC = _m_pSVC;

#pragma mark-
//-(void)setParent:(id)sender
//{
//    self.m_pSVC = sender;
//}

#pragma mark-

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setFrame:CGRectMake(0, 0, 320, 460)];
    
    UIButton *pBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pBtn setFrame:CGRectMake(100, 100, 100, 50)];
    
    [pBtn setTitle:@"switch view"
          forState:UIControlStateNormal];
    
    [self.view addSubview: pBtn];
    
    //获取应用程序及代理的指针
    UIApplication *pApp = [UIApplication sharedApplication];
    SwitchViewAppDelegate *pDelegate = pApp.delegate;
    
    SwitchViewController *pSwitchVC = pDelegate.m_pSwitchVC;
    
    //给按钮设置事件响应方法
    [pBtn addTarget: pSwitchVC  //self.m_pSVC
             action:@selector(switchView:)
   forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
