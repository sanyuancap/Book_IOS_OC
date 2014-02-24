//
//  DisclosureButtonController.h
//  Nav
//
//  Created by liduan on 10-12-12.
//  Copyright 2010 HitMobile. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

@class DisclosureDetailController;

@interface DisclosureButtonController : SecondLevelViewController {
	DisclosureDetailController * childController;
	NSArray  *list;
}

@property (nonatomic,retain) NSArray  * list;

@end
