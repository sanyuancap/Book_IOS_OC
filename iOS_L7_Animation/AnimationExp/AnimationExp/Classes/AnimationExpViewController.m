//
//  AnimationExpViewController.m
//  AnimationExp
//
//  Created by liduan on 11-3-22.
//  Copyright 2011 HitMobile. All rights reserved.
//

#import "AnimationExpViewController.h"
#import <QuartzCore/QuartzCore.h>
@implementation AnimationExpViewController
-(IBAction)fadeBtnPressed:(id)sender{
	
	[self actAnimation:0];
}
-(IBAction)pushBtnPressed:(id)sender{

	[self actAnimation:2];
}
-(IBAction)revealBtnPressed:(id)sender{

	[self actAnimation:3];
}
-(IBAction)moveinBtnPressed:(id)sender{

	[self actAnimation:1];
}

-(void)actAnimation:(NSInteger)animationType
{
	// Set up the animation
	CATransition *animation = [CATransition animation];
	animation.delegate = self;
	animation.duration = 1.0f;
	animation.timingFunction = UIViewAnimationCurveEaseInOut;
	
    switch (animationType)
	{
		case 0:
			animation.type = kCATransitionFade;
			break;
		case 1:
			animation.type = kCATransitionMoveIn;
			break;
		case 2:
			animation.type = kCATransitionPush;
			break;
		case 3:
			animation.type = kCATransitionReveal;
		default:
			break;
	}
	
	animation.subtype = kCATransitionFromRight;
	// Perform the animation
	UIView *whitebg = [self.view viewWithTag:10];
	
    NSInteger view1 = [[whitebg subviews]
                       indexOfObject:[whitebg viewWithTag:99]];
	
    NSInteger view2 = [[whitebg subviews]
                       indexOfObject:[whitebg viewWithTag:100]];
	
    [whitebg exchangeSubviewAtIndex:view1
                 withSubviewAtIndex:view2];
    
	[[whitebg layer] addAnimation:animation
                           forKey:@"animation"];
	
	// Allow or disallow user interaction (otherwise you can touch "through"
	// the cover view to enable/disable the switch)
	if (view1 < view2) 
		[self.view viewWithTag:99].userInteractionEnabled = YES;
	else 
		[self.view viewWithTag:99].userInteractionEnabled = NO;
}

-(IBAction)curlupBtnPressed:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:1.0];
    
	UIView *whitebg = [self.view viewWithTag:10];
    
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView: whitebg cache:YES];
    
	NSInteger view1 = [[whitebg subviews]
                       indexOfObject:[whitebg viewWithTag:99]];
    
	NSInteger view2 = [[whitebg subviews]
                       indexOfObject:[whitebg viewWithTag:100]];
    
    NSLog(@"view1:%d",view1);
    NSLog(@"view2:%d",view2);

    
	[whitebg exchangeSubviewAtIndex:view1
                 withSubviewAtIndex:view2];
	
    [UIView commitAnimations];
}
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


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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
