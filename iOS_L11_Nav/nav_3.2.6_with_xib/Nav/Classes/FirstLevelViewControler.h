//
//  FirstLevelViewControler.h
//  Nav
//
//  Created by LiDuan on 10-12-10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FirstLevelViewControler :UITableViewController {
	NSArray  *controllers;
}

@property (nonatomic, retain) IBOutlet NSArray  *controllers;

@end
