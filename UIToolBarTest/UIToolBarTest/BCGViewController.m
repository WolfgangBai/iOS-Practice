//
//  BCGViewController.m
//  UIToolBarTest
//
//  Created by baichenggang on 16/4/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "BCGViewController.h"

@interface BCGViewController ()<NSURLSessionTaskDelegate>
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftFixed;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftFlex;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *middleFlex;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightFlex;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *homeButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightFixed;


@property (nonatomic,strong) WKWebView *webView;
@end

@implementation BCGViewController
//懒加载
- (WKWebView *) webView{
    if (_webView ==nil) {
        _webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
        
    }
    return _webView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置NSURL
    NSURL *url= [NSURL URLWithString:@"http://www.writingsky.com"];
    
    //创建网络请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"NSURLSession--------%@",[NSThread currentThread]);
        
        [self.webView loadRequest:request];
    }]resume];

    
    
   
     [self.view addSubview:self.webView];
    [self.toolBar setItems:[NSArray arrayWithObjects:self.leftFixed,self.refreshButton,self.leftFlex,self.forwardButton,self.middleFlex,self.backButton,self.rightFlex,self.homeButton,self.rightFixed,nil] animated:YES];
    [self.view addSubview: self.toolBar];
    
}













- (IBAction)actionWeb:(UIBarButtonItem *)sender {
    switch (sender.tag) {
    case 0:{
        //刷新
        NSLog(@" 刷新");
        [self.webView reload];
    }
        
        break;
        
    case 1:{
        //前进
        NSLog(@" 前进");
        if (self.webView.canGoForward) {
            [self.webView goForward];
        }
    }
        
        break;
    case 2:{
        //后退
         NSLog(@" 后退");
        if (self.webView.canGoBack) {
            NSLog(@"back");
            [self.webView goBack];
        }
    }
        break;
    case 3:{
        //主页面
        NSLog(@" 主页面");
        if (self.webView.backForwardList.backList.count >0) {
            NSLog(@"back");
            [self.webView goToBackForwardListItem:self.webView.backForwardList.backList[0]];
        }
    }
        break;
    default:
        break;
    }

}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
