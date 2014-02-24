//
//  MyViewController.h
//  UIControl
//
//  Created by goodmao on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController<UITextFieldDelegate>


@property (strong, nonatomic) UIImageView *m_pImageView;
@property (strong, nonatomic) UILabel *m_pLabelSliderValue;


-(void)addBackground;
-(void)addLabel;
-(void)addTextFiled;
-(void)addButton;
-(void)addSwitch;
-(void)addSegment;
-(void)addSlide;

@end
