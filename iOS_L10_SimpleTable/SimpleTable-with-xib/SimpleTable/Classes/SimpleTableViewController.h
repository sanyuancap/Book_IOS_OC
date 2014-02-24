//
//  SimpleTableViewController.h
//  SimpleTable
//
//  Created by goodmao on 12-2-13.
//  Copyright 2012 LDCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableViewController : UIViewController
			<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *listData;
}

@property (nonatomic, retain) NSArray *listData;

@end

