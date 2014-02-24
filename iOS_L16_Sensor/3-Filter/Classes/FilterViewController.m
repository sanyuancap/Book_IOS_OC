//
//  FilterViewController.m
//  SensorDemo
//
//  Created by Ma Genius on 11-2-10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FilterViewController.h"

#define kUpdateInterval (1.0f/60.0f)
#define kFilteringFactor 0.1

@implementation FilterViewController
@synthesize currState,unfiltered,filtered;



/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"滤波器";

	isHigh_pass = NO;
	isPause = NO;
	currState.text = @"低通滤波器";

	accel = [UIAccelerometer sharedAccelerometer];
	accel.delegate = self;
	accel.updateInterval = kUpdateInterval;
	

	[unfiltered setIsAccessibilityElement:YES];	
	[unfiltered setAccessibilityLabel:NSLocalizedString(@"unfilteredGraph", @"")];
	
	
	[filtered setIsAccessibilityElement:YES];
	[filtered setAccessibilityLabel:NSLocalizedString(@"filteredGraph", @"")];
}

-(IBAction)buttonPressed:(id)sender
{	
	UIButton *tempBtn = (UIButton*)sender;

	if ([tempBtn.titleLabel.text isEqualToString:@"切换"]) {
		if (isHigh_pass) {
			isHigh_pass = NO;
			currState.text = @"低通滤波器";
		}
		else {
			isHigh_pass = YES;
			currState.text = @"高通滤波器";
		}
		// Inform accessibility clients that the filter has changed.
		UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, nil);
	}
	else if ([tempBtn.titleLabel.text isEqualToString:@"返回"]){
		self.view.hidden = YES;
	}

	else {
		if (isPause) {
			[tempBtn setTitle:@"暂停" forState:UIControlStateNormal];
			isPause = NO;
		}
		else {
			isPause = YES;
			[tempBtn setTitle:@"开始" forState:UIControlStateNormal];						
		}
	}
}





#pragma mark - UIAccelerometerDelegate
- (void)accelerometer:(UIAccelerometer *)accelerometer 
        didAccelerate:(UIAcceleration *)acceleration 
{
	if (isPause)
	{
		return;
	}

	
	if (isHigh_pass) 
	{
		lastX = acceleration.x - ( (acceleration.x * kFilteringFactor) + (lastX * (1.0 - kFilteringFactor)) );
		lastY = acceleration.y - ( (acceleration.y * kFilteringFactor) + (lastY * (1.0 - kFilteringFactor)) );
		lastZ = acceleration.z - ( (acceleration.z * kFilteringFactor) + (lastZ * (1.0 - kFilteringFactor)) );		
	}
	else
	{
		lastX = (acceleration.x * kFilteringFactor) + (lastX * (1.0 - kFilteringFactor));
		lastY = (acceleration.y * kFilteringFactor) + (lastY * (1.0 - kFilteringFactor));
		lastZ = (acceleration.z * kFilteringFactor) + (lastZ * (1.0 - kFilteringFactor));
	}
	
	[unfiltered addX:acceleration.x y:acceleration.y z:acceleration.z];
	[filtered addX:lastX y:lastY z:lastZ];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[accel release];
	
	[currState release];
	[filtered release];
	[unfiltered release];
	
    [super dealloc];
}


@end
