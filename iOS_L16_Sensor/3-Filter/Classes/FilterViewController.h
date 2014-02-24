//
//  FilterViewController.h
//  SensorDemo
//
//  Created by Ma Genius on 11-2-10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"

@class GraphView;
@interface FilterViewController : UIViewController<UIAccelerometerDelegate>{
	UIAccelerometer *accel;
	
	BOOL isHigh_pass;
	UILabel *currState;
	
	
	UIAccelerationValue lastX, lastY, lastZ;
	
	GraphView *unfiltered;
	GraphView *filtered;
	BOOL isPause;
}

@property (nonatomic, retain) IBOutlet UILabel *currState;

@property(nonatomic, retain) IBOutlet GraphView *unfiltered;
@property(nonatomic, retain) IBOutlet GraphView *filtered;

-(IBAction)buttonPressed:(id)sender;

@end
