//
//  NoteSectionViewController.h
//  NoteSection
//
//  Created by han-yuantao on 12/7/09.
//  Copyright sdie 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteSectionViewController : UIViewController 
<UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate> {
	IBOutlet  UITableView *table;
	IBOutlet  UISearchBar *search;
//	NSDictionary *words;
//	NSArray *keys;
	NSDictionary *allWords;
	NSMutableDictionary *words;
	NSMutableArray *keys;
}
//@property (nonatomic, retain) NSDictionary *words;
//@property (nonatomic, retain) NSArray *keys;
@property (nonatomic, retain) UITableView *table;
@property (nonatomic, retain) UISearchBar *search;
@property (nonatomic, retain) NSDictionary *allWords;
@property (nonatomic, retain) NSMutableDictionary *words;
@property (nonatomic, retain) NSMutableArray *keys;
- (void)resetSearch;
- (void)handleSearchForTerm:(NSString  *)searchTerm;
@end

