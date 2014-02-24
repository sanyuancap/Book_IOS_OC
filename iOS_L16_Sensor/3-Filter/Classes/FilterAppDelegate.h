//
//  FilterAppDelegate.h
//  Filter
//
//  Created by Ma Genius on 11-2-17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilterViewController;

@interface FilterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FilterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FilterViewController *viewController;

@end

