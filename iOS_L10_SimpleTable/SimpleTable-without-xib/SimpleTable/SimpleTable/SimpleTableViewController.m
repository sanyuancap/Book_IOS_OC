//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by goodmao on 12-8-21.
//  Copyright (c) 2012年 goodmao. All rights reserved.
//

#import "SimpleTableViewController.h"

@interface SimpleTableViewController ()

@end

@implementation SimpleTableViewController

@synthesize m_pArrayListData = _m_pArrayListData;


- (void)dealloc
{
    [_m_pArrayListData release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.m_pArrayListData = [[NSArray alloc]
                             initWithObjects:@"One", @"Two", @"Three", nil];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


//告诉Xcode编译器，在编辑器窗格顶部的方法弹出菜单中，将代码分隔开显示。

#pragma mark - Table view data source

//====================================================================
// Returns the number of rows (table cells) in a specified section.
// 返回列表中的区域数目
// 默认为1个分区
//====================================================================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    //return 0;
    return 1;
}

//====================================================================
// Returns the number of rows (table cells) in a specified section.
// 返回列表中指定区域的行数
// 即：指定列表的行数
//====================================================================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    // 获取数组中数据元素个数，并返回给列表
    //return 0;
    return [self.m_pArrayListData count];
}

//====================================================================
// Asks the data source for a cell to insert in a particular location of the table view. (required)
// 从数据源获取一个列表单元的数据，并插入到列表中指定的位置（该方法必须实现）
//====================================================================

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    // Returns a reusable table-view cell object located by its identifier.
    // 通过标志位，查找可重用的列表单元
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:CellIdentifier] autorelease];
        
    }
    
    // 创建图像对象并加载图片
    UIImage *pImageNormal = [UIImage imageNamed:@"star_1.png"];
    UIImage *pImageHighLight = [UIImage imageNamed:@"star_2.png"];
    
    // 为列表单元设置图片
    cell.imageView.image = pImageNormal;
    cell.imageView.highlightedImage = pImageHighLight;
    
    // 获取列表中当前行的行号
    NSUInteger nRow = [indexPath row];
    
    // 获取列表中指定行的数据
    cell.textLabel.text = [self.m_pArrayListData objectAtIndex:nRow];
    
    cell.detailTextLabel.text = @"Martin Mao";
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

//====================================================================
// Tells the delegate that the specified row is now selected.
// 通知代理，用户选中了列表中的某一行
//====================================================================

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    // 获取列表中用户选中的行号
    NSUInteger nRow = [indexPath row];
    
    // 获取列表中用户选中的行的数据内容
    NSString *strRowValue = [self.m_pArrayListData objectAtIndex:nRow];
    
    NSString *pMessageStr = [[NSString alloc] initWithFormat:@"You selected %@", strRowValue];
    
    // 创建并显示警告提示框
    UIAlertView *pAlert = [[UIAlertView alloc]
                           initWithTitle:@"Row Selected !"
                           message:pMessageStr
                           delegate:nil
                           cancelButtonTitle:@"Yes I Did"
                           otherButtonTitles:nil];
    [pAlert show];
    [pAlert release];
    [pMessageStr release];
    
    // Deselects a given row identified by index path, with an option to animate the deselection.
    // 取消列表中选中行的状态，变为未选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


//====================================================================
// Asks the delegate to return the level of indentation for a row in a given section.
// 对列表中的给定区域，设置指定行的缩进级别
//====================================================================

- (NSInteger)tableView:(UITableView *)tableView
    indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger nRow = [indexPath row]; // 取当前行号
    return nRow;                                            // 返回行的缩进级别
}

//====================================================================
// Asks the delegate for the height to use for a row in a specified location.
// 设置列表中每行的高度
//====================================================================

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger nRow = [indexPath row];
	if (1 == nRow)
	{
		return 30;
	}
	
    return 90;
}

@end
