//
//  SimpleAudioPlayerViewController.h
//  SimpleAudioPlayer
//
//  Created by liduan on 11-4-2.
//  Copyright 2011 HitMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>

@interface SimpleAudioPlayerViewController : UIViewController 
    <AVAudioPlayerDelegate>
{

	//AVAudioPlayer对象
	AVAudioPlayer *player;
    
	//计时器，用来定时刷新时间标签控件及拖拽进度的数值
	NSTimer *timer;
	
	//滑块控件，用来显示及控制拖拽进度
	UISlider *scrubber;
	//滑块控件，用来显示及控制声音大小
	UISlider *volumeSlider;
	//标签控件，用来显示音频播放的时间
	UILabel *timeLabel;
	//按钮控件，用来控制音频的播放和暂停
	UIButton *playButton;
	//用来控制按钮显示的文本是play还是pause
	BOOL     isPlayBtn;
}

@property (nonatomic,retain) AVAudioPlayer *player;

@property (nonatomic,retain) IBOutlet UISlider *scrubber;
@property (nonatomic,retain) IBOutlet UISlider *volumeSlider;
@property (nonatomic,retain) IBOutlet UILabel *timeLabel;
@property (nonatomic,retain) IBOutlet UIButton *playButton;

//按钮按下事件
-(IBAction)buttonPressed:(id)sender;
//拖拽事件
-(IBAction)scrub:(id)sender;
//拖拽完成事件
-(IBAction)scrubbingDone:(id)sender;
//设置声音事件
-(IBAction)setVolume:(id)sender;

//用来格式化输出音频播放的时间信息
- (NSString *) formatTime: (int) num;
//暂停播放音频
- (void) pause;
//播放音频
- (void) play;
//更新音频播放的时间及进度信息
- (void) updateMeters;

@end

