//
//  SimpleAudioPlayerViewController.m
//  SimpleAudioPlayer
//
//  Created by liduan on 11-4-2.
//  Copyright 2011 HitMobile. All rights reserved.
//

#import "SimpleAudioPlayerViewController.h"

@implementation SimpleAudioPlayerViewController

@synthesize player;
@synthesize scrubber;
@synthesize volumeSlider;
@synthesize timeLabel;
@synthesize playButton;


//用来格式化输出音频播放的时间信息
- (NSString *) formatTime: (int) num
{
    int secs = num % 60;
    int min = num / 60;

    if (num < 60) 
        return [NSString stringWithFormat:@"0:%02d", num];

    return	[NSString stringWithFormat:@"%d:%02d", min, secs];
}

//更新音频播放的时间及进度信息
- (void)updateMeters
{
    [self.player updateMeters];

    self.timeLabel.text = [NSString stringWithFormat:@"%@ of %@", 
                           [self formatTime:self.player.currentTime], 
                           [self formatTime:self.player.duration]];
    self.scrubber.value = (self.player.currentTime / self.player.duration);
}

//暂停播放音频
- (void) pause
{
    if (nil != self.player)
        [self.player pause];

    [timer invalidate]; //关定时器

    self.volumeSlider.enabled = NO;
    self.scrubber.enabled = NO;
}

//播放音频
- (void) play
{
    if (nil != self.player)
        [self.player play];

    self.volumeSlider.value = self.player.volume;
    self.volumeSlider.enabled = YES;

    //开启定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1f 
                    target:self 
                    selector:@selector(updateMeters) userInfo:nil repeats:YES];
    self.scrubber.enabled = YES;
}

//按钮按下事件
- (IBAction) buttonPressed: (id) sender
{
    //用来控制按钮显示的文本是play还是pause
    isPlayBtn = !isPlayBtn;

    if (isPlayBtn)
    {
        [self.playButton setTitle:@"Pause" forState:UIControlStateNormal];
        [self play];
    }
    else 
    {
        [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
        [self pause];
    }
}

//设置声音事件
- (IBAction) setVolume: (id) sender
{
    if (nil != self.player)
        self.player.volume = self.volumeSlider.value;
}

//拖拽完成事件
- (IBAction) scrubbingDone: (id) sender
{
    [self play]; //播放音频
}

//拖拽事件
- (IBAction) scrub: (id) sender
{
	NSLog(@"%s", __FUNCTION__);
    [self.player pause]; //暂停播放

    self.player.currentTime = scrubber.value * self.player.duration;

    NSLog(@"scrub3");
    self.timeLabel.text =  [NSString stringWithFormat:@"%@ of %@", [self formatTime:self.player.currentTime], [self formatTime:self.player.duration]];
}

//委托方法
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
	NSLog(@"%s", __FUNCTION__);
    self.scrubber.value = 0.0f;
    self.scrubber.enabled = NO;
    self.volumeSlider.enabled = NO;
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
    // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSString *audioPath = [[NSBundle mainBundle]
                   pathForResource:@"test" ofType:@"mp3"];
    if (audioPath == NULL)
        return;

    NSURL *audioURL = [NSURL fileURLWithPath: audioPath];
    NSError *error;

    //创建音频播放器
    AVAudioPlayer * tempPlayer = [[AVAudioPlayer alloc] 
								initWithContentsOfURL:audioURL error: &error];
    self.player = tempPlayer;
    [tempPlayer release];

    self.player.delegate = self;

    [self.player prepareToPlay];
    [self.player play];
    
    //[self.player pause];

    self.player.meteringEnabled = YES; //监控音量水平
    //设置开启：更新音频播放的时间及进度信息

    //用来控制按钮显示的文本是play还是pause
    isPlayBtn = NO; //设置播放标志

    [super viewDidLoad];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.scrubber = nil;
	self.volumeSlider = nil;
	self.timeLabel = nil;
	self.playButton = nil;
}


- (void)dealloc {
	[player release];
	[scrubber release];
	[volumeSlider release];
	[timeLabel release];
	[playButton release];
    [super dealloc];
}

@end
