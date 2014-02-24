//
//  StudentInfo.m
//  PListFile4_2
//
//  Created by  on 12-7-28.
//  Copyright (c) 2012年 LDCI. All rights reserved.
//

#import "StudentInfo.h"
#define kId @"ID"
#define kName @"NAME"
@implementation StudentInfo
@synthesize stuId;
@synthesize stuName;
-(void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:stuId forKey:kId];
    [aCoder encodeObject:stuName forKey:kName];
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.stuId = [aDecoder decodeObjectForKey:kId];
        self.stuName = [aDecoder decodeObjectForKey:kName];
    }
    return self;
    
}

-(id) copyWithZone:(NSZone *)zone{
    StudentInfo *copy = [[[self class] allocWithZone:zone] init];
    copy.stuId = [[self.stuId copyWithZone:zone] autorelease];
    copy.stuName = [[self.stuName copyWithZone:zone] autorelease];
    return copy;
}

@end
