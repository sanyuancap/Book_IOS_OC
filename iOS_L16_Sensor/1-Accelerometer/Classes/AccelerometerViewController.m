//
//  AccelerometerViewController.m
//  SensorDemo
//
//  Created by Ma Genius on 11-2-10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AccelerometerViewController.h"

#define kUpdateInterval               (1.0f/30.0f)

@implementation AccelerometerViewController
@synthesize labelX,labelY,labelZ;



 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	//获取加速计实例
	UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
	accel.delegate = self; //设置加速计委托
	accel.updateInterval = kUpdateInterval; //设置加速计更新时间
}


#pragma mark - UIAccelerometerDelegate

//实现加速计委托方法，或许加速计数据x,y,z
- (void)accelerometer:(UIAccelerometer *)accelerometer 
        didAccelerate:(UIAcceleration *)acceleration 
{
	labelX.text = [NSString	stringWithFormat:@"%f",acceleration.x];
	labelY.text = [NSString	stringWithFormat:@"%f",acceleration.y];
	labelZ.text = [NSString	stringWithFormat:@"%f",acceleration.z];	
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
	[labelX release];
	[labelY release];
	[labelZ release];
    [super dealloc];
}


@end
