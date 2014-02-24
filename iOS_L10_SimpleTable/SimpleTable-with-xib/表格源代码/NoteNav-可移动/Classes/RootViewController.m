//
//  RootViewController.m
//  NoteNav
//
//  Created by mingchun liu on 12/10/09.
//  Copyright sdie 2009. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController
@synthesize noteList;

- (void)viewDidLoad {
	self.title=@"Note Scan";
	NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:@"2009-12-01",@"2009-12-02",@"2009-12-03",
					@"2009-12-04",@"2009-12-05",@"2009-12-06",nil];
	self.noteList=array;	
	[array release];
	UIBarButtonItem *moveButton=[[UIBarButtonItem alloc]
								initWithTitle:@"Move"
								style:UIBarButtonItemStyleBordered
								target:self
								action:@selector(noteMove)];
	self.navigationItem.rightBarButtonItem=moveButton;
	[moveButton release];
    [super viewDidLoad];

}//声明一个按钮
- (IBAction)noteMove
{
	[self.tableView setEditing:!self.tableView.editing animated:YES];
}//确定可以编辑
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {

}
- (void)dealloc {
	[noteList release];
    [super dealloc];
}
#pragma mark -
#pragma mark TableviewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [ self.noteList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:CellIdentifier] autorelease];
		cell.showsReorderControl=YES;//设置扩展图标属性
    }
    NSUInteger row=[indexPath row];
	cell.textLabel.text=[noteList objectAtIndex:row];
	return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
		   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}
- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
	  toIndexPath:(NSIndexPath *)toIndexPath 
{
	NSUInteger fromRow=[fromIndexPath row];
	NSUInteger toRow =[toIndexPath row];
	id object=[[noteList objectAtIndex:fromRow]retain];
	[noteList removeObjectAtIndex:fromRow];
	[noteList insertObject:object atIndex:toRow];
	[object release];	
}
@end


