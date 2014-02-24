//
//  DisclosureDetailController.h
//  Nav
//
//  Created by liduan on 10-12-12.
//  Copyright 2010 HitMobile. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DisclosureDetailController : UIViewController {
	UILabel  *label;
	NSString *message;
}

@property (nonatomic,retain) IBOutlet UILabel *label;
@property (nonatomic,retain) NSString * message;

@end
