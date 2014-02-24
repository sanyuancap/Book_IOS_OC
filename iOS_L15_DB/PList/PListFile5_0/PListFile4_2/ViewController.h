//
//  ViewController.h
//  PListFile4_2
//
//  Created by yingyong mao on 12-3-23.
//  Copyright (c) 2012年 LDCI. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFilename @"/data.plist"

@interface ViewController : UIViewController

-(NSString*)dataFilePath;

-(NSString*)archiverDataFilePath;
@end
