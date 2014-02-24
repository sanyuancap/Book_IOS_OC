//
//  StudentInfo.h
//  PListFile4_2
//
//  Created by  on 12-7-28.
//  Copyright (c) 2012年 LDCI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentInfo : NSObject<NSCoding,NSCopying>{
    NSString* stuId;
    NSString* stuName;
}
@property(nonatomic,retain) NSString* stuId;
@property(nonatomic,retain) NSString* stuName;


@end
