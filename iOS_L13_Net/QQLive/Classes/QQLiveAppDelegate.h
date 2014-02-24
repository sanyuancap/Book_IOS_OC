//
//  QQLiveAppDelegate.h
//  QQLive
//
//  Created by LDCI on 10-12-10.
//  Copyright 2010 ldci. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QQLiveViewController;

@interface QQLiveAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    QQLiveViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet QQLiveViewController *viewController;

@end

