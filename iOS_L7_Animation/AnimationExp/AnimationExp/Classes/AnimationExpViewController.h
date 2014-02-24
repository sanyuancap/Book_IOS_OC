//
//  AnimationExpViewController.h
//  AnimationExp
//
//  Created by liduan on 11-3-22.
//  Copyright 2011 HitMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationExpViewController : UIViewController {
	
}

-(IBAction)curlupBtnPressed:(id)sender;
-(IBAction)fadeBtnPressed:(id)sender;
-(IBAction)pushBtnPressed:(id)sender;
-(IBAction)revealBtnPressed:(id)sender;
-(IBAction)moveinBtnPressed:(id)sender;

-(void)actAnimation:(NSInteger)animationType;

@end

