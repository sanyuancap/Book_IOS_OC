//
//  ViewController.m
//  PListFile4_2
//
//  Created by yingyong mao on 12-3-23.
//  Copyright (c) 2012年 LDCI. All rights reserved.
//

#import "ViewController.h"
#import "StudentInfo.h"

//文件：data-goodmao.plist
//路径：/Users/goodmao/Library/Application Support/iPhone Simulator/5.0/Applications/FBBBBE11-ACB5-49F4-966C-74CB462C9F44/Documents



@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"1");
    
    // 1读plist数据
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(
                                                          NSDocumentDirectory,
                                                          NSUserDomainMask,
                                                          YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(documentsDirectory);
    NSString *pListPath = [documentsDirectory 
                           stringByAppendingPathComponent:@"data.plist"];
    NSLog(pListPath);
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:pListPath];
    NSLog(@"array index 0: %@",[array objectAtIndex:0]);
//    
    // 2.读归档文件到NSData
    NSData* aRchiverData = [[NSMutableData alloc] initWithContentsOfFile:[self archiverDataFilePath]];
    NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:aRchiverData];
    StudentInfo *stu = [unArchiver decodeObjectForKey:@"StuInfo"];
    [unArchiver finishDecoding];
    NSLog(@"id:%@,name:%@",stu.stuId,stu.stuName);
    
    [unArchiver release];
    [aRchiverData release];
    
    // o:直接把文件读到NSData
    NSData *data = [NSData dataWithContentsOfFile:pListPath];
    int fileSize = [data length];
    NSLog(@"%d",fileSize);
    Byte *byteData;
    byteData = (Byte*)[data bytes];
    NSString* infos = [[NSString alloc] initWithBytes:byteData length:fileSize encoding:NSUTF8StringEncoding];
    NSLog(@"%@",infos);
    
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillTerminate:) name:
     UIApplicationWillTerminateNotification                                object:app];
    
}

-(NSString*)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:kFilename];
    
}
     
-(NSString*)archiverDataFilePath
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        return [documentsDirectory stringByAppendingPathComponent:@"stu_archive"];
        
    }

- (void)applicationWillTerminate:(UIApplication *)application
{
   
    // 1. 写数据到plist
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:@"1234"];
    
    [array writeToFile:[self dataFilePath] atomically:YES];
    [array release];
     NSLog(@"applicationWillTerminate:%@",[self dataFilePath]);
    
    // 2.写归档文件
    StudentInfo *stu = [[StudentInfo alloc] init];
    stu.stuId = @"1001";
    stu.stuName = @"张三";
    
    NSMutableData *muData = [[NSMutableData alloc] init];
    NSKeyedArchiver * aChiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:muData];
    [aChiver encodeObject:stu forKey:@"StuInfo"];
    [aChiver finishEncoding];
    [muData writeToFile:[self archiverDataFilePath] atomically:YES];
    
    NSLog(@"applicationWillTerminate:%@",[self archiverDataFilePath]);
    
    [stu release];
    [muData release];
    [aChiver release];

}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
