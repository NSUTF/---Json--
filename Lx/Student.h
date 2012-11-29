//
//  Student.h
//  Lx
//
//  Created by peng cui on 12-9-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
//封装属性
@property(retain,nonatomic)NSString *name;
//封装属性
@property(retain,nonatomic)NSData *iamge;
//封装属性
@property(assign,nonatomic)int sid;
//封装属性
@property(assign,nonatomic)int age;
//增加数据库信息
+(void)insert:(NSString *)sname andiamge:(NSData *)siamge andage:(int)sage; 
//查找sid
+(Student *)findbid:(int)sid;
@end








