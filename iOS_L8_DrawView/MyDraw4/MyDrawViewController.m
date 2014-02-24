//
//  MyDrawViewController.m
//  MyDraw4
//
//  Created by yingyong mao on 12-3-13.
//  Copyright (c) 2012年 LDCI. All rights reserved.
//

#import "MyDrawViewController.h"
#import "DrawView.h"

@implementation MyDrawViewController

@synthesize m_pDrawView = _m_pDrawView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Button deal

// for UILabel
-(void)createLabel
{
    // 创建并显示标签
    CGRect labelFrame = CGRectMake(0, 30, 150, 30);
    UILabel *pLabel = [[UILabel alloc] initWithFrame:labelFrame];
    
    // 设置颜色
    pLabel.backgroundColor = [UIColor blueColor];
    pLabel.textColor       = [UIColor yellowColor];
    
    // 设置字体与字号
    pLabel.font  = [UIFont fontWithName:@"Verdana" size:18.0];
    
    // 设置文本行数与待显示字符串内容
    pLabel.numberOfLines   = 2;
    pLabel.text   = @"Hello Goodmao\nSeconde LIne";
    
    [self.view addSubview:pLabel];
    [pLabel release];
}

// 创建UIImageView
// 加载图片文件并显示
-(void)createImageView
{
    // 加载并显示图片
    UIImage *pImage = [UIImage imageNamed:@"1.png"];
    UIImageView *pImageView = [[UIImageView alloc] initWithImage:pImage];
    [pImageView setFrame:CGRectMake(10.0, 50.0, 200, 260)];
    [self.view addSubview:pImageView];
    [pImage release];
    [pImageView release];
}

// 创建UIButton
-(void)createButton
{
    // 创建并显示按钮
    CGRect btnFrame = CGRectMake(200.0, 100.0, 100.0, 50.0);
    
    // 创建按钮
    UIButton *pButton = [[UIButton alloc] initWithFrame:btnFrame];
    
    // 设置按钮图片
    [pButton setImage:[UIImage imageNamed:@"to_back_1.png"]forState:UIControlStateNormal];
    
    // 设置按钮的响应方法
    [pButton addTarget:self action:@selector(buttonDown:)forControlEvents:UIControlEventTouchUpInside];
    
    // 将按钮添加到视图显示
    [self.view addSubview:pButton];
    
    // 释放按钮资源
    [pButton release];
}

// for UIButton
// 按钮事件的响应方法
-(void)buttonDown:(id)sender
{
    NSLog(@"Button pushed down");

    if ([self.m_pDrawView isHidden])
    {
        [self.m_pDrawView setHidden:NO];
    }
    else
    {
        [self.m_pDrawView setHidden:YES];
    }
}

// 创建自定义视图
-(void)createDrawView
{
    CGRect frame = CGRectMake(60.0f, 200.0f, 300, 440);
    // 创建DrawView视图类的对象
    self.m_pDrawView = [[DrawView alloc] initWithFrame:frame];

    // 设置背景色
    self.m_pDrawView.backgroundColor = [UIColor lightGrayColor];
    //----------设置中心点
    _m_pDrawView.center = CGPointMake(160.0f, 250.0f);
    
    // 添加到视图上
    [self.view addSubview:self.m_pDrawView];
}


#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self createLabel];
    //[self createImageView];

   // [self createButton];
    [self createDrawView];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
