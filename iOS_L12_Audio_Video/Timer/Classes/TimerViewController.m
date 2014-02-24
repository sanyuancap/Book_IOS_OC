//
//  TimerViewController.m
//  Timer
//
//  Created by goodmao on 12-3-20.
//  Copyright 2012 LDCI. All rights reserved.
//

#import "TimerViewController.h"

@implementation TimerViewController

@synthesize timer;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
    [super viewDidLoad];
    
    NSLog(@"1");
    
    //创建、设置定时器回调方法，并开启定时器
    NSTimer *timerTemp = [NSTimer scheduledTimerWithTimeInterval:0.1f 
                                    target:self 
                                    selector:@selector(updateDisplay) 
                                    userInfo:nil
                                    repeats:YES];
    self.timer = timerTemp;
    
    NSLog(@"2");
    
    [timerTemp release];
    NSLog(@"3");
}

//实现定时器回调方法
- (void)updateDisplay
{
    NSLog(@"___");
    
    //停止定时器
    [self.timer invalidate];
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
}


- (void)dealloc {
    [super dealloc];
}

@end
