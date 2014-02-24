//
//  RowControlsController.h
//  Nav
//
//  Created by liduan on 10-12-13.
//  Copyright 2010 HitMobile. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"
@interface RowControlsController : SecondLevelViewController {
	NSArray *list;
}
@property (nonatomic,retain) NSArray *list;
-(IBAction)buttonTapped:(id)sender;
@end
