//
//  LiteEngine.h
//  QSqlite
//
//  Created by LDCI on 11-1-24.
//  Copyright 2011 ldci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
//#import "/usr/include/sqlite3.h"

@interface MemberDao : NSObject
{
    sqlite3* sqliteDB;
}

- (BOOL)createChannelsTable;
- (BOOL)initDatabase:(NSString *)dbName;
- (void)closeDatabase;

- (BOOL)insertOneChannel:(NSString *)name cage:(int)age caddress:(NSString *)addr csex:(NSString *)sex;

- (NSMutableArray*) getStudentsByName:(NSString*) name;

- (NSMutableArray*) getAllDatas;
- (BOOL)isHasTable:(NSString *)tableName;

@end
