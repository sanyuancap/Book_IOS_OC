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
@synthesize editState;
#pragma mark -
#pragma Table Methods

- (IBAction)noteMove
{
	editState=YES;
	[self.tableView setEditing:!self.tableView.editing animated:YES];
}
- (IBAction)noteDelete:(id)sender
{
	editState=NO;
	[self.tableView setEditing:!self.tableView.editing animated:YES];
}
//初始化
- (void)viewDidLoad {
	self.title=@"Note Scan";
	NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:@"2009-12-01",@"2009-12-02",@"2009-12-03",
					@"2009-12-04",@"2009-12-05",@"2009-12-06",nil];
	self.noteList=array;	
	[array release];
	//创建Move按钮,放到右侧
	UIBarButtonItem *moveButton=[[UIBarButtonItem alloc]
								initWithTitle:@"Move"
								style:UIBarButtonItemStyleBordered
								target:self
								action:@selector(noteMove)];
	self.navigationItem.rightBarButtonItem=moveButton;
	[moveButton release];
	//创建Delete按钮,放到左侧
	UIBarButtonItem *deleteButton=[[UIBarButtonItem alloc]
								   initWithTitle:@"Delete" 
								   style:UIBarButtonItemStyleBordered
								   target:self 
								   action:@selector(noteDelete:)];
	self.navigationItem.leftBarButtonItem=deleteButton;
	[deleteButton release];
	editState=NO;
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];	
	// Release any cached data, images, etc that aren't in use.
}
- (void)viewDidUnload
{}

//删除方法
- (void)dealloc {
	[noteList release];
    [super dealloc];
}

#pragma mark -
#pragma mark TableviewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [ self.noteList count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:CellIdentifier] autorelease];
		cell.showsReorderControl=YES;
    }
    NSUInteger row=[indexPath row];
	cell.textLabel.text=[noteList objectAtIndex:row];
	return cell;
}
#pragma mark -
#pragma mark Table Delete Methods
//移动行
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
		   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(!editState)
		return UITableViewCellEditingStyleDelete;
	else 
		return UITableViewCellEditingStyleNone;

}//如编辑状态为假则进行删除操作,如果为真则进入编辑状态

- (BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(editState)
		return YES;
	else
		return NO;
}//判断能够拖动
- (void)tableView:(UITableView *)tableView
	moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath 
{
	NSUInteger fromRow=[fromIndexPath row];
	NSUInteger toRow =[toIndexPath row];
	id object=[[noteList objectAtIndex:fromRow]retain];
	[noteList removeObjectAtIndex:fromRow];
	[noteList insertObject:object atIndex:toRow];
	[object release];	
}//移动时真正调用的方法
//删除行
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)
	editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row=[indexPath row];
	[self.noteList removeObjectAtIndex:row];
	[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
			withRowAnimation:UITableViewRowAnimationFade];
		}
@end

