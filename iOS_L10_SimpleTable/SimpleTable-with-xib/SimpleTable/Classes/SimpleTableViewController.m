//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by goodmao on 12-2-13.
//  Copyright 2012 LDCI. All rights reserved.
//

#define __MY_DEBUG__

#import "SimpleTableViewController.h"
#import "common.h"

@implementation SimpleTableViewController

@synthesize listData;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	NSArray *array = [[NSArray alloc] initWithObjects:@"About", @"Button",
                      @"Care", @"Doc", @"Egg", @"Flush", @"Green", @"Hurry",
                      @"Identify", @"Genal", @"Kindle", @"Length", @"Mother", @"None", @"Open",
                      @"Panda", @"Query", @"Read", @"Stone", @"Thank", nil];
	
	self.listData = array;
	[array release];
	
	[super viewDidLoad];
}



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
	
	self.listData = nil;
}


- (void)dealloc {
	[listData release];
    [super dealloc];
}



//告诉Xcode编译器，在编辑器窗格顶部的方法弹出菜单中，将代码分隔开显示。
#pragma mark -
#pragma mark --- Table View Data Source Methods ---

//====================================================================
// Returns the number of rows (table cells) in a specified section.
// 返回列表中指定区域的行数
// 即：指定列表的行数
//====================================================================

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count]; // 获取数组中数据元素个数，并返回给列表
}

//====================================================================
// Asks the data source for a cell to insert in a particular location of the table view. (required)
// 从数据源获取一个列表单元的数据，并插入到列表中指定的位置（该方法必须实现）
//====================================================================

- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    // Returns a reusable table-view cell object located by its identifier.
    // 通过标志位，查找可重用的列表单元
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: SimpleTableIdentifier];
    if (cell == nil)
    {
        // 若无可重用的列表单元，则创建一个新的列表单元
        
        #ifdef __IPHONE_3_0
        // Other styles you can try
        // UITableViewCellStyleSubtitle
        // UITableViewCellStyleValue1
        // UITableViewCellStyleValue2

        cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle//UITableViewCellStyleValue1
									   reuseIdentifier: SimpleTableIdentifier]
										autorelease];
        #else
        cell = [[[UITableViewCell alloc] initWithFrame: CGRectZero
									   reuseIdentifier: SimpleTableIdentifier] 
										autorelease];
        #endif
    }

    // 创建图像对象并加载图片
    UIImage *image = [UIImage imageNamed:@"star.png"];
    UIImage *image2 = [UIImage imageNamed:@"star2.png"];
	
    // 为列表单元设置图片
    cell.imageView.image = image;
    cell.imageView.highlightedImage = image2;

    // 获取列表中当前行的行号
    NSUInteger row = [indexPath row];
    // 获取列表中指定行的数据
    cell.textLabel.text = [listData objectAtIndex:row];
    //cell.textLabel.font = [UIFont boldSystemFontOfSize:50];

    // 设置列表中的详情字段
    //#ifdef __IPHONE_3_0    
    if (row < 7)
        cell.detailTextLabel.text = @"Mrs. Lee";
    else
        cell.detailTextLabel.text = @"Mr. Mark";
    //#endif
    return cell;
}




#pragma mark -
#pragma mark Table Delegate Methods

//====================================================================
// Asks the delegate to return the level of indentation for a row in a given section.
// 对列表中的给定区域，设置指定行的缩进级别
//====================================================================

- (NSInteger)tableView:(UITableView *)tableView 
    indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row]; // 取当前行号
    return row;                                            // 返回行的缩进级别
}

//====================================================================
// Asks the delegate for the height to use for a row in a specified location.
// 设置列表中每行的高度
//====================================================================

- (CGFloat)tableView:(UITableView *)tableView 
    heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

//====================================================================
// Tells the delegate that the specified row is now selected.
// 通知代理，用户选中了列表中的某一行
//====================================================================

- (void)tableView:(UITableView *)tableView 
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	__GOODMAO_LOG__;

    // 获取列表中用户选中的行号
    NSUInteger row = [indexPath row];
    // 获取列表中用户选中的行的数据内容
    NSString *rowValue = [listData objectAtIndex:row];
    
    // 创建并显示警告提示框
    NSString *message = [[NSString alloc] initWithFormat:
                         @"You selected %@", rowValue];
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:@"Row Selected!"
                          message:message 
                          delegate:nil 
                          cancelButtonTitle:@"Yes I Did" 
                          otherButtonTitles:nil];
    [alert show];
    
    [message release];
    [alert release];
    
    // Deselects a given row identified by index path, with an option to animate the deselection.
    // 取消列表中选中行的状态，变为未选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

	__GOODMAO_LOG__;
}




@end
