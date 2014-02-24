//
//  GPSViewController.h
//  SensorDemo
//
//  Created by Ma Genius on 11-2-10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface GPSViewController : UIViewController <CLLocationManagerDelegate> {
	CLLocationManager    *locationManager;


	UILabel *currlog;
	UILabel *currlat;
	
	UILabel *header;
}

@property (nonatomic, retain) IBOutlet UILabel *currlog;
@property (nonatomic, retain) IBOutlet UILabel *currlat;
@property (nonatomic, retain) IBOutlet UILabel *header;
@end
