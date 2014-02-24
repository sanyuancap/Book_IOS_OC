//
//  DrawView.h
//  MyDraw4
//
//  Created by yingyong mao on 12-3-13.
//  Copyright (c) 2012年 LDCI. All rights reserved.
//

#import <UIKit/UIKit.h>

static const float DISPLAY_SHOWREC_LT_X = 5.0; // 显示背景矩形区域左上角坐标
static const float DISPLAY_SHOWREC_LT_Y = 5.0; // 显示背景矩形区域左上角坐标
static const float DISPLAY_SHOWREC_RB_X = 80.0; // 显示背景矩形区域右下角坐标
static const float DISPLAY_SHOWREC_RB_Y = 50.0; // 显示背景矩形区域右下角坐标

@interface DrawView : UIView

@property(nonatomic, assign) CGPoint m_startPosition;   //起点坐标
@property(nonatomic, assign) CGPoint m_currentPosition; //终点坐标

@end