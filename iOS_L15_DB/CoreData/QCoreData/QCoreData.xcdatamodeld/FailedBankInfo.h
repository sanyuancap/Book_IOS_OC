//
//  FailedBankInfo.h
//  QCoreData
//
//  Created by LDCI on 11-1-25.
//  Copyright 2011 ldci. All rights reserved.
//

#import <CoreData/CoreData.h>

@class FailedBankDetails;


@interface FailedBankInfo :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) FailedBankDetails * details;

@end



