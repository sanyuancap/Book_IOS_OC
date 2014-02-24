//
//  NoteNavAppDelegate.h
//  NoteNav
//
//  Created by mingchun liu on 12/10/09.
//  Copyright sdie 2009. All rights reserved.
//

@interface NoteNavAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

