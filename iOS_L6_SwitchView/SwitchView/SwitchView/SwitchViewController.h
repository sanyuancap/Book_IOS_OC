//
//  SwitchViewController.h
//  SwitchView
//
//  Created by goodmao on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlueViewController.h"
#import "YellowViewController.h"

@interface SwitchViewController : UIViewController

@property (nonatomic, strong) BlueViewController *m_pBlueVC;

@property (nonatomic, strong) YellowViewController *m_pYellowVC;

-(void)switchView:(id)sender;

@end







