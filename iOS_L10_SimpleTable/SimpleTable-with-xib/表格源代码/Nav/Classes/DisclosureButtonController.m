//
//  DisclosureButtonController.m
//  Nav
//
//  Created by liduan on 10-12-12.
//  Copyright 2010 HitMobile. All rights reserved.
//

#import "DisclosureButtonController.h"
#import "NavAppDelegate.h"
#import "DisclosureDetailController.h"
@implementation DisclosureButtonController
@synthesize list;

-(void)viewDidLoad 
{
	NSArray *array = [[NSArray alloc]initWithObjects:@"Toy Story",@"A Bug's Life",@"Toy story 2",@"Monsters,Inc.",
					  @"Finding Nemo",@"The Incredibles",@"Cars",@"Raratouille",@"WALL-E",@"Up",@"Toy story 3",
					  @"cars 2",@"The Bear and the Bow",@"Newt",nil];
	self.list = array;
	[array release];
	[super viewDidLoad];

}
-(void)viewDidUnload
{

	self.list = nil;
	[childController release];
	childController = nil;
	[super viewDidUnload];
}

-(void)dealloc
{
	[list release];
	[childController release];
	[super dealloc];

}

#pragma mark -
#pragma mark Tabel Data Source Methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return [list count];
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString * DisclosureButtonCellIdentifier =@"DisclosureButtonCellIdentifier";
	UITableViewCell  *cell  =[tableView dequeueReusableCellWithIdentifier:DisclosureButtonCellIdentifier];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DisclosureButtonCellIdentifier]autorelease];
	}
	NSUInteger row = [indexPath row];
	NSString   *rowString = [list objectAtIndex:row];
	cell.textLabel.text = rowString;
	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	[rowString release];
	return cell;
}

#pragma mark -
#pragma mark Table View Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	//NSUInteger row = [indexPath row];
//	SecondLevelViewController *nextController = [self.controllers objectAtIndex:row];
//	[self.navigationController pushViewController:nextController animated:YES];
	UIAlertView  *alert = [[UIAlertView alloc]initWithTitle:@"Hey,do you see the disclosure button?" message:@"if you try to drill down,touch that instead"delegate:nil cancelButtonTitle:@"Won't happen again" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
	if (childController == nil) 
	{
		childController = [[DisclosureDetailController alloc] 
						  initWithNibName:@"DisclosureDetail" 
						     bundle:nil];
	}
	childController.title = @"Disclosure Button Pressed";
	NSInteger row = [indexPath row];
	
	NSString *selectedMovie = [list objectAtIndex:row];
	NSString *detailMessage = [[NSString alloc]initWithFormat:@"you pressed the disclosure button for %@",selectedMovie];
	childController.message = detailMessage;
	childController.title   = selectedMovie;
	[detailMessage release];
	[self.navigationController pushViewController:childController animated:YES];
}

@end
