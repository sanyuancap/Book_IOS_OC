//
//  FailedBankDetails.h
//  QCoreData
//
//  Created by LDCI on 11-1-25.
//  Copyright 2011 ldci. All rights reserved.
//

#import <CoreData/CoreData.h>

@class FailedBankInfo;

@interface FailedBankDetails :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * closeDate;
@property (nonatomic, retain) NSNumber * zip;
@property (nonatomic, retain) NSDate * updateDate;
@property (nonatomic, retain) FailedBankInfo * info;

@end



