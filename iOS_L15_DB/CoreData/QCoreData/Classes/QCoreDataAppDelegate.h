//
//  QCoreDataAppDelegate.h
//  QCoreData
//
//  Created by LDCI on 11-1-24.
//  Copyright 2011 ldci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface QCoreDataAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UIButton *btnSave1;
	UIButton *btnRead1;
	UIButton *btnSave2;
	UIButton *btnRead2;
	
	UITextView *txtView;
	
@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIButton *btnSave1;
@property (nonatomic, retain) IBOutlet UIButton *btnRead1;
@property (nonatomic, retain) IBOutlet UIButton *btnSave2;
@property (nonatomic, retain) IBOutlet UIButton *btnRead2;
@property (nonatomic, retain) IBOutlet UITextView *txtView;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSString *)applicationDocumentsDirectory;
- (void)saveContext;

- (IBAction)btnClickedSave1:(id)sender;
- (IBAction)btnClickedSave2:(id)sender;
- (IBAction)btnClickedRead1:(id)sender;
- (IBAction)btnClickedRead2:(id)sender;
@end

