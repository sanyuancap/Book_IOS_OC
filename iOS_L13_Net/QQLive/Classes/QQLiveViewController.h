//
//  QQLiveViewController.h
//  QQLive
//
//  Created by LDCI on 10-12-10.
//  Copyright 2010 ldci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QQLiveViewController : UIViewController
{
    IBOutlet UIButton		*m_pBtnStart;
    IBOutlet UITextField	*m_pEditQQ;
    IBOutlet UILabel		*m_pLabResult;
    IBOutlet NSString		*m_pQQData;

    UIImageView *imageView; //背景视图
}

@property(retain, nonatomic) UIButton		*m_pBtnStart;
@property(retain, nonatomic) UITextField	*m_pEditQQ;
@property(retain, nonatomic) UILabel		*m_pLabResult;

-(IBAction)onBtnStartClicked:(id)sender;
-(IBAction)resignText:(id)sender;


@end

