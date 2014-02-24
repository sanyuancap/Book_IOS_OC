//
//  FirstLevelViewControler.m
//  Nav
//
//  Created by LiDuan on 10-12-10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FirstLevelViewControler.h"
#import "SecondLevelViewController.h"
#import "DisclosureButtonController.h"
#import "CheckLishController.h"
#import "RowControlsController.h"

@implementation FirstLevelViewControler

@synthesize controllers;

-(void)viewDidLoad {
	self.title = @"First Lever";
	NSMutableArray  *array = [[NSMutableArray alloc]init];
	
	//disclosure button 详情/细节展示按钮
	DisclosureButtonController *disclosureButtonController = [[DisclosureButtonController alloc] initWithStyle:UITableViewStylePlain];
	disclosureButtonController.title = @"Disclosure Buttons";
	disclosureButtonController.rowImage= [UIImage imageNamed:@"disclosureButtonControllerIcon.png"];
	[array addObject:disclosureButtonController];
	[disclosureButtonController release];
	
	//check list 检查表
	CheckLishController  * checkLishController = [[CheckLishController alloc ]initWithStyle:UITableViewStylePlain];
	checkLishController.title = @"Check One";
	checkLishController.rowImage = [UIImage imageNamed:@"checkmarkControllerIcon.png"];
	[array addObject:checkLishController];
	[checkLishController release];
	
	//Table Row Controls 表行控件
	RowControlsController *rowControlsController = [[RowControlsController alloc] initWithStyle:UITableViewStylePlain];
	rowControlsController.title = @"Row Controls";
	rowControlsController.rowImage = [UIImage imageNamed:@"rowControlsIcon.png"];
	[array addObject:rowControlsController];
	[rowControlsController release];
	self.controllers = array;
	[array release];
	
	[super viewDidLoad];
}

-(void)viewDidUnload {
	self.controllers = nil;
	[super viewDidUnload];
}

-(void)dealloc {
	[controllers release];
	[super dealloc];
}

#pragma mark -
#pragma mark Table Data Sourec Methods

//设置分区中的行数
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return [self.controllers count];

}

//绘制特定的一行
- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"%s %s %d", __FILE__, __FUNCTION__, __LINE__);
	static NSString * firstLevelCell =@"FirstLevelCell";
	UITableViewCell  *cell  =[tableView dequeueReusableCellWithIdentifier:firstLevelCell];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:firstLevelCell]autorelease];
	}
	NSUInteger row = [indexPath row];
	SecondLevelViewController *controller = [controllers objectAtIndex:row];
	cell.textLabel.text = controller.title;
	cell.imageView.image = controller.rowImage;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //为每行设置一个细节展示按钮
	return cell;
}

#pragma mark -
#pragma mark Table View Delegate Methods

//处理已被选中的行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	NSUInteger row = [indexPath row];
	SecondLevelViewController *nextController = [self.controllers objectAtIndex:row];
	[self.navigationController pushViewController:nextController animated:YES];
}

@end
