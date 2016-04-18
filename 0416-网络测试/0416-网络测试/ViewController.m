//
//  ViewController.m
//  0416-网络测试
//
//  Created by baichenggang on 16/4/16.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
    NSLog(@"begin");
    // http://www.baidu.com" 服务器的地址: IP 地址!域名==IP地址,域名是 IP 地址的一个速记符号!
    NSURL *url = [NSURL URLWithString:@"http://www.writingsky.com"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    // 浏览器可以直接加载网络请求!
    // 这样直接加载出来的数据,就是适配了客户端的数据!
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.frame];
    
    [web loadRequest:request];
    
    [self.view addSubview:web];
}


@end
