//
//  NoteSectionAppDelegate.h
//  NoteSection
//
//  Created by han-yuantao on 12/7/09.
//  Copyright sdie 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NoteSectionViewController;

@interface NoteSectionAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NoteSectionViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NoteSectionViewController *viewController;

@end

