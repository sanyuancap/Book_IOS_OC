//
//  GPSViewController.m
//  SensorDemo
//
//  Created by Ma Genius on 11-2-10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GPSViewController.h"

#define DEGREES_TO_RADIANS(__ANGLE) ((__ANGLE) * M_PI / 180.0)

@implementation GPSViewController
@synthesize currlog,currlat,header;

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
	
    //
	locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate = self;
	locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	locationManager.distanceFilter = 100.0f;
	[locationManager startUpdatingLocation];
	
	if (locationManager.headingAvailable) 
	{
		locationManager.headingFilter = 0.1;
		[locationManager startUpdatingHeading];
	}
	
}

#pragma mark - 我的当前位置
#pragma mark locationManager delegate
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
	NSString *latitudeString = [[NSString alloc] initWithFormat:@"%g°", 
								newLocation.coordinate.latitude];
	currlat.text = latitudeString;
	[latitudeString release];

	NSString *longitudeString = [[NSString alloc] initWithFormat:@"%g°", 
								 newLocation.coordinate.longitude];
	currlog.text = longitudeString;
	[longitudeString release];
    
    NSLog(@"latitude = %@, longitudee = %@", currlat.text, currlog.text);
}

- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error
{	
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"Hello"
						  message:@"获取位置失败!"
						  delegate:nil
						  cancelButtonTitle:@"OK"
						  otherButtonTitles:nil];
	[alert show];
	[alert release];	
}

#pragma mark  指南针
- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading
{	
    //NSLog(@"%s, %d", __FUNCTION__, __LINE__);
    
	//if (newHeading.headingAccuracy > 0)
	{
		CLLocationDirection theHeading = newHeading.magneticHeading;

		header.text = [NSString stringWithFormat:@"=== %f",theHeading];
        
		//NSLog(@"旋转角度--%f",theHeading);
        //NSLog(@"angle--- %f", theHeading);
        NSString *str;
		//这样就得到了旋转的角度可以根据具体的需求处理
        if (180.0 <= theHeading)
        {
            str = [NSString stringWithFormat:@"angle = %f --- S",theHeading];
        }
        else
        {
            str = [NSString stringWithFormat:@"angle = %f --- North",theHeading];
        }
        
        NSLog(@"angle--- %@", str);
	}	
}

//遇到电磁干扰时，是否弹出按8字形摆动iPhone校准指南针的界面。
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
	return YES;
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
	[currlog release];
	[currlat release];
	[locationManager release];
	[header release];
    [super dealloc];
}


@end
