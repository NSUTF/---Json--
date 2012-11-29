//
//  Student.m
//  Lx
//
//  Created by peng cui on 12-9-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Student.h"
#import "DataDB.h"
@implementation Student

@synthesize  name;
@synthesize  iamge;
@synthesize  sid;
@synthesize  age;
//增加学生信息传入三个参数分别为sname,siamge,age;
+(void)insert:(NSString *)sname andiamge:(NSData *)siamge andage:(int)sage
{
    //打开数据库
    sqlite3 *sqlite=[DataDB OpenDataDB];
    //创建数据库指针
    sqlite3_stmt *stmt=nil;
    //编译数据库语法
    int f=sqlite3_prepare_v2(sqlite, "insert into Student (sname,sage,siamge)values(?,?,?)", -1, &stmt, nil);
    //语法正确
    if (SQLITE_OK==f)
    { 
        //使用不同数据类型绑定语句，给数据语句占位符
        sqlite3_bind_text(stmt, 1, [sname UTF8String], -1, nil);
        //使用不同数据类型绑定语句，给数据语句占位符
        sqlite3_bind_int(stmt, 2, sage);
        //使用不同数据类型绑定语句，给数据语句占位符
        sqlite3_bind_blob(stmt, 3, [siamge bytes], [siamge length], nil);
        //执行数据库语句
        sqlite3_step(stmt);
        
    }
    //销毁数据库语名句
    sqlite3_finalize(stmt);
}

//查找数据库语名句
+(Student *)findbid:(int)sid
{
    //定议学生对象
    Student *stu=nil;
    //打开数据库
    sqlite3 *sqlite=[DataDB OpenDataDB];
    //创建数据库语句对象
    sqlite3_stmt *stmt=nil;
    //创建数据库语法
    int f=sqlite3_prepare_v2(sqlite, "select *from Student where sid=?", -1, &stmt, nil);
    //判断语法正确
    if (SQLITE_OK==f)
    {
    
        //使用不同数据类型绑定语句，给数据语句占位符
        sqlite3_bind_int(stmt, 1, sid);
        //循环执行数据库列
        while (sqlite3_step(stmt)==SQLITE_ROW) 
        {
            //转为字符串接收数据库语法查找的名字
            NSString * ssname=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 0)];
            //编译数据语法查对象内容
            int ssage=sqlite3_column_int(stmt, 1);
            //编译数据的长度
            int leng=sqlite3_column_bytes(stmt, 2);
            //用nsdata类型接收数据
            NSData *ssiamge=[NSData dataWithBytes:  sqlite3_column_blob(stmt, 2)length:leng];
            //初始化对象
            stu=[[Student alloc]init];
            //给对象赋值
            stu.name=ssname;
            //给对象赋值
            stu.age=ssage;
            //给对象赋值
            stu.iamge=ssiamge;
        }
        //执行数据库
        sqlite3_step(stmt);
    }
    //销毁数据库语句
    sqlite3_finalize(stmt);
    //返回对象
    return [stu autorelease];
}


@end












