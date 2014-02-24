//
//  RootViewController.h
//  NoteNav
//
//  Created by mingchun liu on 12/10/09.
//  Copyright sdie 2009. All rights reserved.
//

@interface RootViewController : UITableViewController 
	<UITableViewDelegate, UITableViewDataSource>{
		NSMutableArray *noteList;
}
@property (nonatomic, retain)NSMutableArray *noteList;
- (IBAction)noteMove;
@end
