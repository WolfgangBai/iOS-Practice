//
//  ViewController.m
//  0421-NSURLSession
//
//  Created by baichenggang on 16/4/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()<NSURLSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"begin");
    [self nsurlSessionTest];
  
}

-(void)sdwebIamgeTest{
    //创建imageView
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:imageView];
    
    //设置下载图片链接
    NSString *imageString=@"http://h.hiphotos.baidu.com/zhidao/pic/item/bd3eb13533fa828b39c0b816fc1f4134960a5a67.jpg";
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageString] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}


- (void)nsurlSessionTest{
    //创建imageView
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:imageView];
    //设置下载图片链接
    NSString *imageUrl=@"http://h.hiphotos.baidu.com/zhidao/pic/item/bd3eb13533fa828b39c0b816fc1f4134960a5a67.jpg";
    //设置NSSURLConfiguration
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //session的使用
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    
    //创建下载任务
    NSURLSessionDownloadTask *imageTask = [session downloadTaskWithURL:[NSURL URLWithString:imageUrl] completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *downloadImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        NSLog(@"%@",downloadImage);
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image =downloadImage;
        });
    }];
    
    [imageTask resume];

}
@end
