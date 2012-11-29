//
//  DataDB.m
//  Lx
//
//  Created by peng cui on 12-9-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataDB.h"

@implementation DataDB


//创建单例模式
static sqlite3 *dbpiont=nil;
//打开数据库方法
+(sqlite3 *)OpenDataDB
{
    //判断数据库不为空
    if (dbpiont) 
    {
        //返回一个地址
        return dbpiont;
    }
    //创建docment路径
    NSString *filpath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    //并接docment数据路径
    NSString *file=[filpath stringByAppendingPathComponent:@"json.sqlite" ];
    //创建沙盒 
    NSString *filebunld=[[NSBundle mainBundle]pathForResource:@"json" ofType:@"sqlite"];
    //创建管理文件
    NSFileManager *fm=[NSFileManager defaultManager];
    //判断文件路径不为空
    if (![fm fileExistsAtPath:file]) 
    {
        //创建错误信息
        NSError *err=nil;
        //复制路径
        [fm copyItemAtPath:filebunld toPath:file error:&err];
    }
    //打开数据库
    sqlite3_open([file UTF8String], &dbpiont);
    //返回地址；
    return dbpiont;
}
//关闭数据库
+(void)closeDataDB
{
    //判断数据库是否打开
    if (dbpiont)
    {
        //关闭数据库
        sqlite3_close(dbpiont);
    }
}


@end



