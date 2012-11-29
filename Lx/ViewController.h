//
//  ViewController.h
//  Lx
//
//  Created by peng cui on 12-9-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<NSURLConnectionDataDelegate>

//封装可变数据
@property(retain,nonatomic)NSMutableData *iamgeData;
//封装文本框
@property (retain, nonatomic) IBOutlet UITextField *IdField;
//封装标签
@property (retain, nonatomic) IBOutlet UILabel *nameLable;
//封装标签
@property (retain, nonatomic) IBOutlet UILabel *ageLable;
//封装图片
@property (retain, nonatomic) IBOutlet UIImageView *iamge;



@end







