//
//  CheckLishController.h
//  Nav
//
//  Created by liduan on 10-12-13.
//  Copyright 2010 HitMobile. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

@interface CheckLishController : SecondLevelViewController {
	NSArray *list;
	NSIndexPath *lastIndexPath;
}

@property (nonatomic,retain) NSArray *list;
@property (nonatomic,retain) NSIndexPath *lastIndexPath;

@end
