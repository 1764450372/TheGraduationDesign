//
//  ASTabBarViewController.h
//  text
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHTabBarViewController : UITabBarController
/**
 *  功能: 根据所给类名设置控制器所对应的标签的标题,图片,选中图片
 *
 *  @param controllerName 控制器的类名
 *  @param title           标签的标题
 *  @param imageName      正常状态下标签图片
 *  @param selectedImage  选中状态下标签图片
 */
-(void) setcontroller:(NSString *)controllerName title:(NSString *) title imageNamed:(NSString *)imageName selectedImageName:(NSString *)selectedImage;
@end
