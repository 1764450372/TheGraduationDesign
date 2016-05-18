//
//  StartViewController.h
//  OTR_Pre
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^Start)();
@interface HHStartViewController : UIViewController
@property (nonatomic,copy) Start start;
@end
