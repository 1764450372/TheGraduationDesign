//
//  ASTabBarViewController.m
//  text
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "HHTabBarViewController.h"
#import "HHNavigationController.h"


@interface HHTabBarViewController ()<UITabBarControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation HHTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) setcontroller:(NSString *)controllerName title:(NSString *) title imageNamed:(NSString *)imageName selectedImageName:(NSString *)selectedImage
{
    
    Class controllerClass=NSClassFromString(controllerName);
    UIViewController *controller=[[controllerClass alloc]init];
    controller.title=title;
    UIImage *normalImage=[[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    UIImage *selectImage=[[UIImage imageNamed:selectedImage] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    controller.tabBarItem=[[UITabBarItem alloc]initWithTitle:title image:normalImage selectedImage:selectImage];
    HHNavigationController *nc=[[HHNavigationController alloc]initWithRootViewController:controller];
    
    NSMutableArray *array=[NSMutableArray arrayWithArray:self.viewControllers];
    [array addObject:nc];
    self.viewControllers=array;
    
}

@end
