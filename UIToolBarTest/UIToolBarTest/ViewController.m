//
//  ViewController.m
//  UIToolBarTest
//
//  Created by baichenggang on 16/4/19.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置四个按钮的标题
    //NSArray *buttonItem_Title = @[@"重载",@"前进",@"后退",@"主页面"];
    
    //设置toolbar的宽度
    CGFloat width = self.view.bounds.size.width;
    
    //设置toolbar的高度
    CGFloat height =44;
    
    
    CGFloat toolbarY=self.view.bounds.size.height - 44;
    //创建一个toolbar
    UIToolbar *toolbar =[[UIToolbar alloc]initWithFrame:CGRectMake(0, toolbarY, width, height)];
    
    //创建barbuttonitem
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(test:)];
    
       //创建barbuttonitem
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem: UIBarButtonSystemItemSave target:self action:nil];
    
    //调整俩个item之间的距离.flexible表示距离是动态的。
//    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //调整俩个item之间的距离，fixed表示固定
    UIBarButtonItem *fixed = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    
    //设置fixed的宽度
    [fixed setWidth:100];
    
    //把item添加到toolbar里
    [toolbar setItems:[NSArray arrayWithObjects:item1,fixed,item2,nil] animated:YES];
    
    
    //把toolbar添加到view上
    [self.view addSubview:toolbar];
    
}
-(void)test:(id)sender{
    NSLog(@"item1");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
