//
//  ViewController.m
//  Lx
//
//  Created by peng cui on 12-9-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "JSON.h"
#import "Student.h"
@implementation ViewController

//解封图片数据
@synthesize  iamgeData;
//解封文本框
@synthesize IdField;
//解封标签
@synthesize nameLable;
//解封标签
@synthesize ageLable;
//解封图片
@synthesize iamge;

//按钮方法
- (IBAction)findeId:(id)sender 
{
    //查找findbid方法传进来的是整型，所以要转为字符型值给数据库student创建对象st；
    Student *st=[Student findbid:[IdField.text intValue]];
    //数据库对象st.name是字符串类型，内容返回给视图中的namelable.texgt显示接收的类型是字符型;
    nameLable.text=st.name;
    //数据库对st.age是整型，内容返回给视图中的agelable.text显示接收的类型是字符型所以要转为字符型；
    ageLable.text=[NSString stringWithFormat:@"%d",st.age];
    //数据库对st.iamge是NSData类型，内容返回给视图中的iamge.image显示接收的类型是字符型所以要转为字符型；
    iamge.image=[UIImage imageWithData:st.iamge];
    //键盘回收
    [IdField resignFirstResponder];

    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //创建网络连接地址
    NSURL *url=[NSURL URLWithString:@"http://127.0.0.1/JSON.JSON"];
    //发送一个网络请求
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //发送异步连接请求
    [NSURLConnection connectionWithRequest:request delegate:self];
}
//看查代理
#pragma mark connction
//请求连接
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //返回数据
    iamgeData=[[NSMutableData alloc]init];
}
//返回数据下载
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //将每次下载的数据加载到self.iamgedata中
    [self.iamgeData appendData:data];
}
//下载完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //下载数据用nsstring接收将下载的数据转为oc的数据
    NSString *jsonstr=[[NSString alloc]initWithData:self.iamgeData encoding:NSUTF8StringEncoding];
    //用数组来接收下载后转为oc的数据
    NSArray *ar1=[jsonstr JSONValue];
    //用字典来取数组中的值
    NSDictionary *dic=[ar1 objectAtIndex:0];
    NSLog(@"dic=====%@",dic);
    //用字典来取数组中的值
    NSDictionary *dic1=[ar1 objectAtIndex:1];
     NSLog(@"dic1=====%@",dic1);
    //将字典中的网址再次连接网络将图片数据内容存入nsdata中
    NSData *da=[NSData dataWithContentsOfURL:[NSURL URLWithString:[dic objectForKey:@"iamge"]]];
    //将字典中的网址再次连接网络将图片数据内容存入nsdata中
//    NSData *da1=[NSData dataWithContentsOfURL:[NSURL URLWithString:[dic1 objectForKey:@"iamge"]]];
    //将字典的键值转为字符串
    NSString *name=[dic objectForKey:@"name"];
    //将字典的键值转为字符串
    NSString *age=[dic objectForKey:@"age"];
    //将字符串强转整型
    int age1=[age intValue];
    //student调用数据库增加方法分别传入三个参数类型 
    [Student insert:name andiamge:da andage:age1];
    //同上，调用数据库增加信息方法分别传入三个参数类型
//    [Student insert:[dic1 objectForKey:@"name"] andiamge:da1 andage:[[dic1 objectForKey:@"age"]intValue]];    
    
}
- (void)viewDidUnload
{
    [self setIdField:nil];
    [self setNameLable:nil];
    [self setAgeLable:nil];
    [self setIamge:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [IdField release];
    [nameLable release];
    [ageLable release];
    [iamge release];
    [super dealloc];
}
@end
