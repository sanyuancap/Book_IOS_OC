//
//  DisclosureDetailController.m
//  Nav
//
//  Created by liduan on 10-12-12.
//  Copyright 2010 HitMobile. All rights reserved.
//

#import "DisclosureDetailController.h"


@implementation DisclosureDetailController
@synthesize label;
@synthesize message;

-(void)viewWillAppear:(BOOL)animated
{
	label.text = message;
	[super viewWillAppear:animated];
}
-(void)viewDidUnload
{
	
	self.label = nil;
	self.message = nil;
	[super viewDidUnload];
}

-(void)dealloc
{
	[label release];
	[message release];
	[super dealloc];
	
}
@end
