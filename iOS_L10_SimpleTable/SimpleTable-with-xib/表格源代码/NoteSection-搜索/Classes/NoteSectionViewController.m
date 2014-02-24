//
//  NoteSectionViewController.m
//  NoteSection
//
//  Created by han-yuantao on 12/7/09.
//  Copyright sdie 2009. All rights reserved.
//

#import "NoteSectionViewController.h"
#import "DictionaryMutableDeepCopy.h"

@implementation NoteSectionViewController
@synthesize words;
@synthesize keys;
@synthesize table;
@synthesize search;
@synthesize allWords;

- (void)resetSearch
{
	self.words=[self.allWords mutableDeepCopy];
	NSMutableArray *keyArray=[[NSMutableArray alloc]init];
	[keyArray addObjectsFromArray:[[self.allWords allKeys]
								   sortedArrayUsingSelector:@selector(compare:)]];
	self.keys=keyArray;
	[keyArray release];
}
- (void)handleSearchForTerm:(NSString *)searchTerm
{
	NSMutableArray *sectionsRemove=[[NSMutableArray alloc]init];
	[self resetSearch];
	
	for(NSString *key in self.keys)
	{
		NSMutableArray *array=[words valueForKey:key];
		NSMutableArray *toRemove=[[NSMutableArray alloc]init];
		for(NSString *word in array)
		{
			if([word rangeOfString :searchTerm
							 options:NSCaseInsensitiveSearch].location==NSNotFound)
				[toRemove addObject:word];
      		}
        
		if ([array count]==[toRemove count])
			[sectionsRemove addObject:key];
        
		[array removeObjectsInArray:toRemove];
		[toRemove release];
	}
	[self.keys removeObjectsInArray:sectionsRemove];
	[sectionsRemove release];
	[table reloadData];
}

#pragma mark -
#pragma mark UIViewController Methods

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	NSString *wordsPath=[[NSBundle mainBundle]pathForResource:@"NoteSection"
													   ofType:@"plist"];
	NSDictionary *dictionary=[[NSDictionary alloc]initWithContentsOfFile:wordsPath];
	//self.words=dictionary;
	self.allWords=dictionary;
	[dictionary release];
//	NSArray *array=[[words allKeys]sortedArrayUsingSelector:@selector(compare:)];
//	self.keys=array;
	[self resetSearch];
	search.autocapitalizationType=UITextAutocapitalizationTypeNone;
	search.autocorrectionType=UITextAutocorrectionTypeNo;
    
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
- (void)dealloc
{
	[table release];
	[search release];
	[allWords release];
	[words release];
	[keys release];
    [super dealloc];
}

#pragma mark -
#pragma mark TableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	//return [keys count];
	return ([keys count]>0)?[keys count]:1;
}

- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
	if([keys count]==0)
		return 0;
	NSString *key=[keys objectAtIndex:section];
	NSArray *wordSection=[words objectForKey:key];
	return [wordSection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSUInteger section=[indexPath section];
	NSUInteger row=[indexPath row];
	NSString *key=[keys objectAtIndex:section];
	NSArray *wordSection=[words objectForKey:key];
	static  NSString *NoteSectionIdentifier=@"NoteSectionIdentifier";
	UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NoteSectionIdentifier];
	if(cell==nil)
	{
		cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
									reuseIdentifier:NoteSectionIdentifier];
	}
	cell.textLabel.text=[wordSection objectAtIndex:row];
	return cell;
}
- (NSString *)tableView:(UITableView *)tableView
	titleForHeaderInSection:(NSInteger)section
{
	if([keys count]==0)
		return @" ";
	NSString *key=[keys objectAtIndex:section];
	return key;
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
	return keys;
}
#pragma mark -
#pragma mark TableViewDelegate Methods
-(NSIndexPath *)tableView:(UITableView *)tableView
	willSeclectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[search resignFirstResponder];
	return indexPath;
}
#pragma mark -
#pragma mark SearchBarDelegate Methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	NSString *searchTerm=[searchBar text];
	[self handleSearchForTerm:searchTerm];
}
- (void)searchBar:(UISearchBar *)searchBar
	textDidChange:(NSString *)searchTerm;
{
	if([searchTerm length]==0)
	{
		[self resetSearch];
		[table reloadData];
		return;
	}
	[self handleSearchForTerm:searchTerm];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	search.text=@"";
	[self resetSearch];
	[table reloadData];
	[searchBar resignFirstResponder];
}


@end
