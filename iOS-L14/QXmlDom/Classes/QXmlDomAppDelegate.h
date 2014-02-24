//
//  QXmlDomAppDelegate.h
//  QXmlDom
//
//  Created by qin jie on 11-2-28.
//  Copyright 2011 ldci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface QXmlDomAppDelegate : NSObject <UIApplicationDelegate, NSXMLParserDelegate> {
    
	UIWindow *window;
	
	IBOutlet UIButton *btnXmlParseOfDOM;
	IBOutlet UIButton *btnXmlParseOfSAX;
	IBOutlet UITextView *txtResultView;
    
	//SAX
	NSXMLParser	*xmlParse;
	NSMutableString *strSaxResult;
	NSMutableString *strTmpSax;
@private
	NSManagedObjectContext *managedObjectContext_;
	NSManagedObjectModel *managedObjectModel_;
	NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIButton *btnXmlParseOfDOM;
@property (nonatomic, retain) IBOutlet UIButton *btnXmlParseOfSAX;
@property (nonatomic, retain) IBOutlet UITextView *txtResultView;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSString *)applicationDocumentsDirectory;
- (void)saveContext;

- (IBAction)btnClickXMLParseOfDOM:(id)sender;
- (IBAction)btnClickXMLParseOfSAX:(id)sender;

@end

