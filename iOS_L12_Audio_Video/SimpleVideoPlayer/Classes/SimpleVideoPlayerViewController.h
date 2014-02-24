//
//  SimpleVideoPlayerViewController.h
//  SimpleVideoPlayer
//
//  Created by liduan on 11-4-1.
//  Copyright 2011 HitMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface SimpleVideoPlayerViewController : UIViewController {
	MPMoviePlayerController *moviePlayer;
	UITextView *logView;
}

@property (retain, nonatomic) IBOutlet UITextView *logView;
@property (retain, nonatomic) MPMoviePlayerController *moviePlayer;

- (IBAction) playVideo:(id)sender;
- (void) appendTextToLogView: (NSString*) text;

@end

