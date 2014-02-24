//
//  AccelerometerViewController.h
//  SensorDemo
//
//  Created by Ma Genius on 11-2-10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AccelerometerViewController : UIViewController <UIAccelerometerDelegate>{
	UILabel *labelX;
    UILabel *labelY;
    UILabel *labelZ;
}
@property (nonatomic, retain) IBOutlet UILabel *labelX;
@property (nonatomic, retain) IBOutlet UILabel *labelY;
@property (nonatomic, retain) IBOutlet UILabel *labelZ;

@end
