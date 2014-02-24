//
//  SwitchViewController.m
//  SwitchView
//
//  Created by goodmao on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SwitchViewController.h"

@interface SwitchViewController ()

@end

@implementation SwitchViewController

@synthesize m_pBlueVC = _m_pBlueVC;
@synthesize m_pYellowVC = _m_pYellowVC;

#pragma mark -

-(void)switchView:(id)sender
{
    NSLog(@"%s", __FUNCTION__);
    
    
    if (nil == self.m_pYellowVC.view.superview)
    {
        [self.m_pBlueVC.view removeFromSuperview];
        [self.view insertSubview:self.m_pYellowVC.view
                         atIndex:0];
    }
    else {
    
        [self.m_pYellowVC.view removeFromSuperview];
        [self.view insertSubview:self.m_pBlueVC.view
                         atIndex:0];
    }
}

#pragma mark -

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
    
    self.m_pBlueVC = [[BlueViewController alloc] init];
    self.m_pBlueVC.view.backgroundColor = [UIColor blueColor];
   
    //[self.m_pBlueVC setParent:self];
    
    [self.view addSubview:self.m_pBlueVC.view];
    
    self.m_pYellowVC = [[YellowViewController alloc] init];
    self.m_pYellowVC.view.backgroundColor = [UIColor yellowColor];
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

-(void)dealloc
{
    [_m_pYellowVC release];
    [_m_pBlueVC release];
    [super dealloc];
}

@end



