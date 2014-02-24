//
//  RowControlsController.m
//  Nav
//
//  Created by liduan on 10-12-13.
//  Copyright 2010 HitMobile. All rights reserved.
//

#import "RowControlsController.h"


@implementation RowControlsController
@synthesize list;

//按钮响应方法
-(IBAction)buttonTapped:(id)sender
{
	UIButton *senderButton = (UIButton *)sender;
	UITableViewCell *buttonCell = (UITableViewCell *)[senderButton superview];
	NSInteger buttonRow = [[self.tableView indexPathForCell:buttonCell] row];
	NSString  *buttonTitle = [list objectAtIndex:buttonRow];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"you tapped the button" message:[NSString stringWithFormat:@"You tapped the button for %@",buttonTitle] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

-(void)viewDidLoad 
{
	NSArray *array = [[NSArray alloc]initWithObjects:@"R2-D2",@"C3PO",@"Tik-Tok",@"Robby",@"Rosie",@"Uniblab"
					  ,@"Bender",@"Marvin",@"Lt.Commander Data",@"Evil Brother Lore",@"Lt.Command Data",@"Evil Brother Lore"
					  ,@"Optimus Prime",@"Tobor",@"HAL",@"Orgasmatron",nil];
	
	self.list = array;
	[array release];
	[super viewDidLoad];

}

-(void)viewDidUnload
{
	self.list = nil;
	[super viewDidUnload];

}

-(void)dealloc
{
	[list release];
	[super dealloc];

}

#pragma mark -
#pragma mark Tabel Data Source Methods

//设置分区中的行数
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return [list count];
	
}

//绘制特定的一行
- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString * ControlRowIdentifier =@"ControlRowIdentifier";
	UITableViewCell  *cell  =[tableView dequeueReusableCellWithIdentifier:ControlRowIdentifier];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ControlRowIdentifier]autorelease];
		UIImage  *buttonUpImage = [UIImage imageNamed:@"button_up.png"];
		UIImage  *buttonDownImage = [UIImage imageNamed:@"button_down.png"];
		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.frame     = CGRectMake(0.0, 0.0,buttonUpImage.size.width,buttonUpImage.size.height);
		[button setBackgroundImage:buttonUpImage forState:UIControlStateNormal];
		[button setBackgroundImage:buttonDownImage forState:UIControlStateHighlighted];
		[button setTitle:@"Tap" forState:UIControlStateNormal];
		[button addTarget:self action:@selector(buttonTapped:) 
					forControlEvents:UIControlEventTouchUpInside];
		cell.accessoryView = button;
		
	}
	NSUInteger row = [indexPath row];
	NSString   *rowString = [list objectAtIndex:row];
	cell.textLabel.text = rowString;
	return cell;
}

#pragma mark -
#pragma mark Table View Delegate Methods

//处理已被选中的行
- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	NSUInteger row = [indexPath row];
	NSString   *rowString = [list objectAtIndex:row];
	
	//	SecondLevelViewController *nextController = [self.controllers objectAtIndex:row];
	//	[self.navigationController pushViewController:nextController animated:YES];
	
	UIAlertView  *alert = [[UIAlertView alloc]
						   initWithTitle:@"you tapped the row." 
						message:[NSString stringWithFormat:@"you tapped %@.",rowString]
						   delegate:self 
						   cancelButtonTitle:@"Cancel" 
						   otherButtonTitles:@"OK",@"3", nil];
	[alert show];
	[alert release];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSLog(@"%d", buttonIndex);
}
@end
