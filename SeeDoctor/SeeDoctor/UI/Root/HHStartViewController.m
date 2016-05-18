//
//  StartViewController.m
//  OTR_Pre
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "HHStartViewController.h"
#import "HHTabBarViewController.h"
#import "AppDelegate.h"
@interface HHStartViewController ()<UITabBarControllerDelegate>

@end

@implementation HHStartViewController
{
      UIScrollView * _scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*3, [UIScreen mainScreen].bounds.size.height );
    [self.view addSubview:_scrollView];
    _scrollView.userInteractionEnabled = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO ;
    _scrollView.backgroundColor = [UIColor yellowColor];
    _scrollView.userInteractionEnabled = YES;
    for (int  i = 0; i < 3 ; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*[UIScreen mainScreen].bounds.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        imageView .userInteractionEnabled = YES;
        [_scrollView addSubview:imageView];
        NSString * str = [NSString stringWithFormat:@"start%d",i];
        imageView.image = [UIImage imageNamed:str];
        if (i==2) {
            UIButton * button = [UIButton buttonWithType:(UIButtonTypeCustom)];
            button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, [UIScreen mainScreen].bounds.size.height-100, 100, 50);
            [button setTitle:@"立即体验" forState:(UIControlStateNormal)];
            [imageView addSubview:button];
            button.backgroundColor = [UIColor grayColor];
            [button addTarget:self action:@selector(start:) forControlEvents:(UIControlEventTouchUpInside)];
        }
    }
}
-(void) start:(id)sender{
    if (_start) {
        _start();
   
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];    
}

@end
