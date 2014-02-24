//
//  SimpleVideoPlayerViewController.m
//  SimpleVideoPlayer
//
//  Created by liduan on 11-4-1.
//  Copyright 2011 HitMobile. All rights reserved.
//

#import "SimpleVideoPlayerViewController.h"

@implementation SimpleVideoPlayerViewController
@synthesize logView;
@synthesize moviePlayer;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
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
    NSString *videoPath = [[NSBundle mainBundle]
                           pathForResource:@"movie" ofType:@"mp4"];
    if (videoPath == NULL)
        return;

    NSURL *videoURL = [NSURL fileURLWithPath: videoPath];
    //创建视频播放器
    MPMoviePlayerController *Player = [[MPMoviePlayerController alloc] 
                                                            initWithContentURL:videoURL];
    self.moviePlayer = Player;

    [[NSNotificationCenter defaultCenter] 
        addObserver: self 
        selector: @selector (playbackFinished:) 
        name:@"MPMoviePlayerPlaybackDidFinishNotification"
        object:nil];

    [Player release];
    
    [super viewDidLoad];
}


-(IBAction)playVideo:(id)sender
{
	[[self.moviePlayer view] setFrame:[self.view bounds]];
	[self.view addSubview:self.moviePlayer.view];
	[self.moviePlayer play];
	
	[self appendTextToLogView:@"Playing"];
}

- (void) appendTextToLogView: (NSString*) text
{
    NSTimeZone *zone = [NSTimeZone defaultTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    NSDate *localeDate = [[NSDate date] addTimeInterval:interval]; 

    logView.text = [NSString stringWithFormat: @"%@%@: %@\n",
					logView.text, [localeDate description], text];
}

//
- (void) playbackFinished: (NSNotification*) notification 
{ 	
	[moviePlayer.view removeFromSuperview]; 	
	[self appendTextToLogView:@"Finished"]; 
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
	self.logView = nil;
}


- (void)dealloc {
	[logView release];
	[moviePlayer release];
    [super dealloc];
}

@end
