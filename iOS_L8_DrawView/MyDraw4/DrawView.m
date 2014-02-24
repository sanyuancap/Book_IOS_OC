//
//  DrawView.m
//  MyDraw4
//
//  Created by yingyong mao on 12-3-13.
//  Copyright (c) 2012年 LDCI. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

@synthesize m_startPosition;
@synthesize m_currentPosition;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//================================================
//
#pragma mark -     重绘指定的屏幕区域______________
//
//================================================
- (void)drawRect:(CGRect)rect

{/*
    CGContextRef context = UIGraphicsGetCurrentContext();

     
    //------------------显示文字提示信息---------------------
    
	// 获取当前图形上下文
	   
	// 保存该图形上下文，因为下面我们要进行上下翻转
	CGContextSaveGState(context);
    
	// 向下移动该图形上下文坐标原点
	CGContextTranslateCTM(context, 0, self.bounds.size.height);
	// 向上翻转图形上下文
	CGContextScaleCTM(context, 1.0, -1.0);
    
    
	// 创建一个字符串，赋值为剩余时间
	NSInteger timeLeft = 10;
	NSString *pStr = [NSString stringWithFormat:@"12346%d", timeLeft];
    
	// 设置字体为16pt Helvetica
	CGContextSelectFont(context, "Helvetica", 16, kCGEncodingMacRoman);
	CGContextSetTextDrawingMode(context, kCGTextFill); // set drawing mode
    
	// 设置文本颜色字符为黑色
	CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
    
	CGAffineTransform myTextTransform = CGAffineTransformMakeRotation(20);
	CGContextSetTextMatrix(context, myTextTransform);
    
	// 将字符串str转换成c字符串，并显示
	CGContextShowTextAtPoint(context, 
                             50, 
                             self.frame.size.height - 100,
                             [pStr cStringUsingEncoding:[NSString  defaultCStringEncoding]], 
                             pStr.length);
	
	// 恢复图形上下文
	CGContextRestoreGState(context);
    */
    
	
    /*
	//------------------显示图像部分---------------------
    
	// 保存该图形上下文，因为下面我们要进行上下翻转
	CGContextSaveGState(context);
    
	// 向下移动该图形上下文坐标原点
	CGContextTranslateCTM(context, 0, self.bounds.size.height);
	// 向上翻转图形上下文
	CGContextScaleCTM(context, 1.0, -1.0);
    

	// 加载背景图片
	UIImage *pImage = [UIImage imageNamed:@"1.png"];
    
	// 创建显示区域
	CGRect imageframe = CGRectMake(20, 20, self.frame.size.width / 3, self.frame.size.height / 3);
    
	// 绘制图片
	CGContextDrawImage(context, imageframe, pImage.CGImage);
    */
    /*
	// ------------------绘制线条------------------

	// 移动线的起点到视图中间位置
	CGContextMoveToPoint(context, self.frame.size.width / 2, self.frame.size.height );
    
	// 添加一根线连接线起点
	CGPoint lineEnd;    // 线的终点坐标
	lineEnd.x = 100;
	lineEnd.y = 100;
    
	CGContextAddLineToPoint(context, lineEnd.x, lineEnd.y);
	CGContextSetLineWidth(context, 3); // set line thickness
	CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0); // black color
	CGContextStrokePath(context); // draw the line
    */
    /*
	//------------------绘制矩形区域---------------------
    
	// 绘制半透明矩形
	CGRect fillRect;
	fillRect.origin.x = 10;
	fillRect.origin.y = 10;
	fillRect.size.width = 200;
	fillRect.size.height = 200;
	
    // 保存当前配置
	CGContextSaveGState(context);
    // 设置填充色
	CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 0.5);
    // 填充指定区域
	CGContextFillRect(context, fillRect);
    
    // 恢复配置
	CGContextRestoreGState(context);
	CGContextStrokePath(context);
    
    
	// 添加一个矩形边框
	CGContextAddRect(context, fillRect);
	CGContextSetLineWidth(context, 1); // set line thickness
	CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5); // black color
	CGContextStrokePath(context); // draw the rec
 
    
    
	//------------------显示文字提示信息---------------------
	//NSString *text = @"你好";
	int n = 10;
	NSString *text = [NSString stringWithFormat:@"时间: %i 秒", n];
	[text drawAtPoint:CGPointMake(10, 10)  withFont:[UIFont fontWithName:@"Helvetica" size:20]];
  
    */
    
    //------------------根据用户触摸绘制线条------------------
    //=========================================================
    // 绘制线条
    
    
    // 获取当前图形上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 保存该图形上下文，因为下面我们要进行上下翻转
    CGContextSaveGState(context);
    
    //设置当前矩阵
    CGContextSetTextMatrix(context, CGAffineTransformMakeScale(1.0, 1.0));
	
    // 设置颜色字符为黑色
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0); //红色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0); //红色
    
    
	// 绘制线	
	
	//CGContextMoveToPoint(context, 10, 10);// 移动线起点到视图中间位置
	CGContextMoveToPoint( context, self.m_startPosition.x, self.m_startPosition.y );
	
	//CGContextAddLineToPoint(context, 100,100);// 添加一根线连接线起点
	CGContextAddLineToPoint( context, self.m_currentPosition.x, self.m_currentPosition.y );
	
	CGContextSetLineWidth(context, 3); // set line thickness
	CGContextStrokePath(context); // draw the line
	
    // 恢复图形上下文
    CGContextRestoreGState(context);
     
     
     
} // end method drawRect:



#pragma mark - Touches ________________

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan:");
    
    UITouch *touch = [touches anyObject];
    self.m_startPosition = [touch locationInView:self];
	
	NSLog(@"s.x = %f, s.y = %f", self.m_startPosition.x, self.m_startPosition.y);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved:");
    
    UITouch *touch = [touches anyObject]; //获取
    self.m_currentPosition = [touch locationInView:self];
	
	
	NSLog(@"s.x = %f, s.y = %f", self.m_currentPosition.x, self.m_currentPosition.y);
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesCancelled:");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded:");
}


@end
