//
//  MyViewController.m
//  UIControl
//
//  Created by goodmao on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

@synthesize m_pImageView = _m_pImageView;
@synthesize m_pLabelSliderValue = _m_pLabelSliderValue;

#pragma mark -

-(void)addBackground
{
    UIImage *pImage = [UIImage imageNamed:@"sea.png"];
    self.m_pImageView = [[UIImageView alloc] initWithImage:pImage];
    //self.m_pImageView.alpha = 0.1;
    [self.view addSubview:self.m_pImageView];
}

/******************************label*******************************************/

-(void)addLabel
{
	CGRect labelFrame = CGRectMake(10,10,200,44);
	
	UILabel *myLabel = [[UILabel alloc] initWithFrame:labelFrame];
	
	myLabel.backgroundColor = [UIColor clearColor];
	myLabel.textColor = [UIColor redColor];
	myLabel.font = [UIFont fontWithName:@"Verdana" size:18.0];
	
	myLabel.numberOfLines = 2;
	myLabel.text = @"Hello World\nSecond line";
	
	myLabel.shadowColor = [UIColor darkGrayColor];
	myLabel.shadowOffset = CGSizeMake(1.0,1.0);
	
	[self.view addSubview:myLabel];
	
	[myLabel release];    
}

/******************************textfield*******************************************/

-(void)addTextFiled
{
	CGRect textRect = CGRectMake(10,60,300,31);
	UITextField *myTextField = [[UITextField alloc] 
                                initWithFrame:textRect];
	myTextField.borderStyle = UITextBorderStyleRoundedRect;
	
	myTextField.font = [UIFont systemFontOfSize:22.0];
	myTextField.adjustsFontSizeToFitWidth = YES;
	myTextField.minimumFontSize = 2.0;
	
	myTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
	myTextField.keyboardType = UIKeyboardTypeDefault;
	
	myTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	myTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
	myTextField.returnKeyType = UIReturnKeyDone;
	
	//myTextField.secureTextEntry = YES;
	
	myTextField.delegate = self;
	
	[self.view addSubview:myTextField];
	
	//force keyboard to show immediately
	[myTextField becomeFirstResponder];
	
	[myTextField release];	
}

//for UITextField
//hide the KeyBoard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	NSLog(@"textFieldShouldReturn:");
	[textField resignFirstResponder];
	return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	/*
	 //limit text field to numeric values only
	 NSCharacterSet *numberSet = [NSCharacterSet decimalDigitCharacterSet];
	 for (NSUInteger i=0; i<[string length]; i++)
	 {
	 unichar ch = [string characterAtIndex:i];
	 if (![numberSet characterIsMember:ch])
	 return NO;
	 }
	 return YES;
	 */
	
	//limit text field to 10 chars
	int MAX_CHARS = 10;
	NSMutableString *newText = [NSMutableString stringWithString:textField.text];
	[newText replaceCharactersInRange:range withString:string];
	return ([newText length] <= MAX_CHARS);
}

/******************************button**********************************************/

-(void)addButton
{	
	//rounded-rect button
	UIButton *roundedRectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	
	CGRect buttonRect = CGRectMake(10,100,100,35);
	[roundedRectButton setFrame:buttonRect];
	//设置标题文字
	[roundedRectButton setTitle:@"Normal" forState:UIControlStateNormal];
	[roundedRectButton setTitle:@"Highlighted" forState:UIControlStateHighlighted];
	
	roundedRectButton.showsTouchWhenHighlighted = YES;
	//设置按钮事件的响应方法
	[roundedRectButton addTarget:self action:@selector(buttonDown:) 
				forControlEvents:UIControlEventTouchDown];
	
	[roundedRectButton addTarget:self action:@selector(buttonRelease:) 
				forControlEvents:UIControlEventTouchUpInside];
	
	//add the rounded-rect button to the main view
	[self.view addSubview:roundedRectButton];
	
	//
	//-------------------------------------------------------------------------
	//checkbox control
	UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
	
	CGRect checkboxRect = CGRectMake(110,100,36,36);
	[checkbox setFrame:checkboxRect];
	
	[checkbox setImage:[UIImage imageNamed:@"checkbox_off.png"] forState:UIControlStateNormal];
	[checkbox setImage:[UIImage imageNamed:@"checkbox_on.png"] forState:UIControlStateSelected];
	
	[checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
	
	//add the checkbox control to the main view
	[self.view addSubview:checkbox];
	
	//-------------------------------------------------------------------------
	//custom circular button
	//创建按钮
	UIButton *circularButton = [UIButton buttonWithType:UIButtonTypeCustom];
	
	//设置按钮区域
	CGRect circularRect = CGRectMake(140, 300, 165, 164);
	[circularButton setFrame:circularRect];
	
	//创建图片对象
	UIImage *buttonImage = [UIImage imageNamed:@"circular_button.png"];
	[circularButton setImage:buttonImage forState:UIControlStateNormal];
	
	//设置按钮的事件处理方法
	[circularButton addTarget:self action:@selector(buttonDown:) 
			 forControlEvents:UIControlEventTouchUpInside];
	
	//add the custom circular button to the main view
	[self.view addSubview:circularButton];
}

//for UIButton
-(void)buttonDown:(id)sender
{
	NSLog(@"Button pushed down");
}

-(void)buttonRelease:(id)sender
{
	NSLog(@"Button released");
}

-(void)checkboxClick:(UIButton *)btn
{
	btn.selected = !btn.selected;
}

/******************************switch*******************************************/	

-(void)addSwitch
{
	CGRect switchRect = CGRectMake(10,140,0,0);
	//创建开关
	UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:switchRect];
	//设置开关事件处理方法
	[mySwitch addTarget:self action:@selector(switchAction:) 
	   forControlEvents:UIControlEventValueChanged];
	
	
	//customize the appearance
    //	UIView *mainView = [[[[mySwitch subviews] objectAtIndex:0] subviews] objectAtIndex:2];
    //	UILabel *onLabel = [[mainView subviews] objectAtIndex:0];
    //	UILabel *offLabel = [[mainView subviews] objectAtIndex:1];
    //	
    //	//change the text
    //	onLabel.text       = @"YES";
    //	offLabel.text      = @"NO";
    //	
    //	//change the text color
    //	onLabel.textColor  = [UIColor yellowColor];
    //	offLabel.textColor = [UIColor greenColor];
	
	//将开关控件放到视图上显示
	[self.view addSubview:mySwitch];
	//释放
	[mySwitch release];
}

//for switch
-(void)switchAction:(id)sender
{
	NSLog(@"switch changed");
	
	UISwitch *mySwitch = (UISwitch *)sender;
	if (mySwitch.isOn)
	{
		NSLog(@"switch on");
		[self.m_pLabelSliderValue setHidden:NO];
		
		//[self.m_pImageView removeFromSuperview];
		//[self.m_pImageView setImage:[UIImage imageNamed:@"circular_button.png"]];
	}
	else
	{
		NSLog(@"switch off");
		[self.m_pLabelSliderValue setHidden:YES];
		
		//[self.m_pImageView removeFromSuperview];
		//[self.m_pImageView setImage:[UIImage imageNamed:@"sea.png"]];
	}
	//[self.view insertSubview:iImageView atIndex:0];
	[self.view addSubview:self.m_pImageView];
}

/******************************slider*******************************************/

-(void)addSlide
{
	//创建滑块并设置区域
	CGRect sliderRect = CGRectMake(10,160,280,40);
	UISlider *mySlider = [[UISlider alloc] initWithFrame:sliderRect];
	//设置滑块属性
	mySlider.minimumValue = 0;
	mySlider.maximumValue = 100;
	mySlider.continuous   = YES;
	
	//images
	UIImage *leftTrackImage  = [[UIImage imageNamed:@"left_slider.png"] 
								stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
	UIImage *rightTrackImage = [[UIImage imageNamed:@"right_slider.png"] 
								stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
	UIImage *thumbImage      = [UIImage imageNamed:@"apple_thumb.png"];
	UIImage *minSliderImage  = [UIImage imageNamed:@"apple_min.png"];
	UIImage *maxSliderImage  = [UIImage imageNamed:@"apple_max.png"];
	
	[mySlider setThumbImage:thumbImage forState:UIControlStateNormal];
	[mySlider setMinimumTrackImage:leftTrackImage forState:UIControlStateNormal];
	[mySlider setMaximumTrackImage:rightTrackImage forState:UIControlStateNormal];
	[mySlider setMinimumValueImage:minSliderImage];
	[mySlider setMaximumValueImage:maxSliderImage];
	[mySlider setValue:100.0f];
	
	//设置滑块的事件处理方法
	//handle value change events
	[mySlider addTarget:self action:@selector(sliderAction:) 
	   forControlEvents:UIControlEventValueChanged];
	
	//label to show current value
	CGRect lblRect = CGRectMake(145,210,100,20);
	self.m_pLabelSliderValue = [[UILabel alloc] initWithFrame:lblRect];
	self.m_pLabelSliderValue.backgroundColor = [UIColor clearColor];
	
	self.m_pLabelSliderValue.text = [NSString stringWithFormat:@"%d",(int)mySlider.value];
	
	//add slider to main view
	[self.view addSubview:mySlider];	
	[self.view addSubview:self.m_pLabelSliderValue];	
	
	[mySlider release];
}

//for slider
-(void)sliderAction:(id)sender
{
	UISlider *pSlide = (UISlider *)sender;
	
	int stepAmount  = 10;
	float stepValue = (abs([(UISlider *)sender value]) / stepAmount) * stepAmount;
	//[(UISlider *)sender setValue:stepValue];
	[pSlide setValue:stepValue];
	
	self.m_pLabelSliderValue.text = [NSString stringWithFormat:@"%d",(int)stepValue];
	
	self.m_pImageView.alpha = stepValue/100;
	
	
}

/******************************segment*******************************************/

-(void)addSegment
{
	//创建数组
	NSArray *arrSegments = [[NSArray alloc] initWithObjects:
							[NSString stringWithString:@"0"],
							[NSString stringWithString:@"1"],
							[NSString stringWithString:@"2"],nil];
	//创建分段控件并用数组进行初始化
	UISegmentedControl *mySegment = [[UISegmentedControl alloc] 
									 initWithItems:arrSegments];
	//指定分段控件显示区域
	CGRect segmentRect = CGRectMake(10,230,300,40);
	[mySegment setFrame:segmentRect];
	//指定分段控件的事件处理方法
	[mySegment addTarget:self action:@selector(segmentClick:) 
		forControlEvents:UIControlEventValueChanged];
	//
	[mySegment setSegmentedControlStyle:UISegmentedControlStyleBar];
	[mySegment setTintColor:[UIColor darkGrayColor]];
	
	//select first item
	[mySegment setSelectedSegmentIndex:1];
	
	//change a segment size
	[mySegment setWidth:120.0 forSegmentAtIndex:1];
	
	//add a new segment
	[mySegment insertSegmentWithTitle:@"new" atIndex:2 animated:YES];
	
	//add segment to main view
	[self.view addSubview:mySegment];	
	
	[arrSegments release];
	[mySegment release];
	
	/******************************segment*******************************************/
}

//for segment
- (void)segmentClick:(id)sender
{
	NSLog(@"you selected segment %d",[sender selectedSegmentIndex]);
}

#pragma mark -

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self addBackground];
    [self addLabel];
    [self addTextFiled];
//    [self addButton];
//    [self addSwitch];
//    [self addSegment];
//    [self addSlide];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    [_m_pImageView release];
    [_m_pLabelSliderValue release];
    [super dealloc];
}

@end
