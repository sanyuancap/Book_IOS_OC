//
//  SimpleTableAppDelegate.h
//  SimpleTable
//
//  Created by goodmao on 12-2-13.
//  Copyright 2012 LDCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleTableViewController;

@interface SimpleTableAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SimpleTableViewController *m_pViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SimpleTableViewController *m_pViewController;

@end

