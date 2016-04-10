//
//  ViewController.m
//  Log
//
//  Created by 段盛武 on 16/4/10.
//  Copyright © 2016年 D.James. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self demo];
}
//例如:用 ANF 框架获取天气,打印结果,如果没有 Log 框架,有些信息,会打印看不懂的 UTF 码,需要转换才能看懂
//当导入 Log的分类就不用,转换,直接打印就能看懂,而且这个小东西 Log, 只是一个分类,不需要导入头文件,只要把文件加到程序中,以后 NSLog 打印如果有 UTF 码,整个程序都能直接使用,在控制台打印出可以看懂的文字
-(void)demo{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *urlString = @"http://www.weather.com.cn/data/sk/101010100.html";
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
