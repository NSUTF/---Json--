//
//  DataDB.h
//  Lx
//
//  Created by peng cui on 12-9-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DataDB : NSObject
//打开数据库
+(sqlite3 *)OpenDataDB;
//关闭数据库
+(void)closeDataDB;


@end
