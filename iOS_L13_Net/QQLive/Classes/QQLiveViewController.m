//
//  QQLiveViewController.m
//  QQLive
//
//  Created by LDCI on 10-12-10.
//  Copyright 2010 ldci. All rights reserved.
//

#import "QQLiveViewController.h"

@implementation QQLiveViewController
@synthesize m_pBtnStart;
@synthesize m_pEditQQ;
@synthesize m_pLabResult;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
 {
}
*/


- (IBAction)resignText:(id)sender
{
    [self.m_pEditQQ resignFirstResponder];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载背景图
    //指定背景图片文件名
    NSString *imagePath = [[NSBundle mainBundle]pathForResource:@"QQLive_Bg_320x460" ofType:@"png"];
    //创建图片对象
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
    //获取当前窗口区域
    CGRect frame = [self.view bounds];
    //也可以用以下方法，指定显示区域
    //CGRect frame = CGRectMake(0.0, 0.0, 320, 460);   
    //根据图片对象构造图像视图对象
    imageView = [[UIImageView alloc]initWithImage:image];
    //设置图像对象显示区域
    [imageView setFrame:frame];
    
    //or
    //    UIImage *image = [UIImage imageNamed:@"QQLive_Bg_320x460.png"];
    //    CGRect frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    //    imageView = [[UIImageView alloc]initWithFrame:frame];
    //    [imageView setImage:image];

    [self.view insertSubview:imageView atIndex:0];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (IBAction)onBtnStartClicked:(id)sender
{
    NSString* strQQ = [m_pEditQQ text];
    NSLog(@"QQ = %@\n", strQQ);

    NSString* strUrl = [@"http://webservice.webxml.com.cn/webservices/qqOnlineWebService.asmx/qqCheckOnline?qqCode=" 
                                    stringByAppendingString:strQQ];
    NSLog(@"url = %@\n", strUrl);

    NSURL* url = [NSURL URLWithString:[strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url 
                                                                                      cachePolicy:NSURLRequestReturnCacheDataElseLoad 
                                                                                  timeoutInterval:60.0];

    [NSURLConnection connectionWithRequest:request delegate:self];
}

//当收到目标服务器的反馈时，会调用该方法
- (void)connection:(NSURLConnection *)connection 
didReceiveResponse:(NSURLResponse*)response
{
	NSLog(@"didReceiveResponse\n");
}

//当从NSURLConnection接收到数据的时候，将会调用该方法
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"didReceiveData\n");
    m_pQQData = [[NSString alloc] initWithData:data 
                                                            encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@ : length = %d", m_pQQData, [data length]);
}

//当NSURLConnection完成数据接收的时候，将会调用该方法
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connectionDidFinishLoading\n");
    NSString* strResult = [m_pQQData substringWithRange:NSMakeRange(78, 1)];
    NSLog(@"result = %@\n", strResult);
    if (NSOrderedSame == [strResult compare:@"N"])
    {
        [m_pLabResult setText:@"你查询的QQ号不在线"];
    }
    else
    {
        [m_pLabResult setText:@"你查询的QQ当前正在线"];
    }
}

//当发生错误，将会调用该方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError*)error
{
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [super dealloc];
}

@end
