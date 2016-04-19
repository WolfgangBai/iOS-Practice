//
//  ViewController.m
//  01-WritringSky
//
//  Created by baichenggang on 16/4/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ViewController.h"
@interface ViewController()<WKNavigationDelegate>

@property (nonatomic,strong) WKWebView *webView;

@end

@implementation ViewController

//懒加载
- (WKWebView *) webView{
    if (_webView ==nil) {
        _webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
        //设置NSURL
        NSURL *url= [NSURL URLWithString:@"http://www.writingsky.com"];
       // NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:[NSURLRequest requestWithURL:url]];
        
        [_webView setNavigationDelegate:self];
        NSLog(@"%@",[NSThread currentThread]);
        
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewdidload");
    [self.view addSubview:self.webView];
    [self addFourBtn];

//    //创建UIwebView 对象
//    UIWebView *webview = [[UIWebView alloc]initWithFrame:self.view.bounds];
//    
//    //设置NSURL
//    NSURL *url= [NSURL URLWithString:@"http://www.baidu.com"];
//    
//    [webview loadRequest:[NSURLRequest requestWithURL:url]];
//    [self.view addSubview:webview];
    //添加按钮
//    [self addFourBtn];
}
//开始加载
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"didStartProvisionalNavigation");
    
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"begin");
//    
//    //创建UIwebView 对象
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        
//        
//        WKWebView *webview = [[WKWebView alloc]initWithFrame:self.view.bounds];
//        
//       
//        //设置NSURL
//        NSURL *url= [NSURL URLWithString:@"http://www.baidu.com"];
//        
//        [webview loadRequest:[NSURLRequest requestWithURL:url]];
//        
//        //在主线程更新UI
//        dispatch_async(dispatch_get_main_queue(), ^{
//            //将webvieW 赋给self
//            
//            self.webView=webview;
//            [self.view addSubview:webview];
//            
//            //添加按钮
//            [self addFourBtn];
//        });
//        
//    });
//
////    //设置前进，后退标签
////    
////    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"confirm" message:nil preferredStyle: UIAlertControllerStyleAlert];
////    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
////        
////    }]];
////    [self presentViewController:alert animated:YES completion:nil];
//
//}

//添加四个按钮
-(void)addFourBtn{
    NSArray *wkWebView_Title = @[@"重载",@"前进",@"后退",@"主页面"];
    
    //设置下边栏的视图
    
    for (int i =0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //按钮的宽度
        CGFloat btnWidth = 60;
        
        //按钮的高度
        CGFloat btnHeight =30;
        
        //按钮的间距
        CGFloat margin = (self.view.bounds.size.width -4*btnWidth)/5;
        CGFloat btnX= (i+1)*margin+i*btnWidth;
        CGFloat btnY= self.view.bounds.size.height - 20 -btnHeight;
        //设置按钮颜色
        
        button.backgroundColor = [UIColor grayColor];
        
        //设置按钮标题
        
        [button setTitle:wkWebView_Title[i] forState:UIControlStateNormal];
        
        //设置按钮的Tag
        button.tag =i;
        [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        [self.view addSubview:button];
    }
}


//设置触摸事件
- (void)Click:(UIButton *)Btn{
    switch (Btn.tag) {
        case 0:{
            //刷新
            [self.webView reload];
        }
        
            break;
           
        case 1:{
            //前进
            if (self.webView.canGoForward) {
                [self.webView goForward];
            }
        }
            
            break;
        case 2:{
            //后退
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
