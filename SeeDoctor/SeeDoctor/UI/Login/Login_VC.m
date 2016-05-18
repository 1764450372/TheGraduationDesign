//
//  Login_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "Login_VC.h"
#import "Regist_VC.h"
#import "HHTabBarViewController.h"
#import "ASRequest.h"
#import "Define.h"
#import "SystemUse.h"
@interface Login_VC ()<UITabBarControllerDelegate,UITextFieldDelegate>

@end

@implementation Login_VC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [self identifyTouch:nil];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)identifyTouch:(id)sender {
    int num = (arc4random() % 1000);
     NSString * string = [NSString stringWithFormat:@"%.4d", num];
    [_identifyButton setTitle:string forState:UIControlStateNormal];
}

- (IBAction)registTouch:(id)sender {
    Regist_VC * regist_vc = [[Regist_VC alloc] init];
    [self presentViewController:regist_vc animated:YES completion:nil];
}

- (IBAction)loginTouch:(id)sender {
//    if (_userName.text.length == 0 ) {
//        [self identifyTouch:nil];
//        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"用户名不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
//            ;
//        }];
//        [alertController addAction:cancelAction];
//        [self presentViewController:alertController animated:YES completion:nil];
//    }else if(_password.text.length == 0 ) {
//        [self identifyTouch:nil];
//        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"密码不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
//            ;
//        }];
//        [alertController addAction:cancelAction];
//        [self presentViewController:alertController animated:YES completion:nil];
//    }else if(_identifyLabel.text.length == 0 ) {
//        [self identifyTouch:nil];
//        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"验证码不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
//            ;
//        }];
//        [alertController addAction:cancelAction];
//        [self presentViewController:alertController animated:YES completion:nil];
//    }else if([_identifyLabel.text isEqualToString:_identifyButton.titleLabel.text] == NO) {
//        [self identifyTouch:nil];
//        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"验证码错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
//            ;
//        }];
//        [alertController addAction:cancelAction];
//        [self presentViewController:alertController animated:YES completion:nil];
//    }else{
//        [ASRequest requestWithUrl:@"" Complete:^(NSData *data) {
//            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
//            [SystemUse setUserName:dic[USER_NAME]];
//            [SystemUse setUserPwd:dic[PWD]];
//            [SystemUse setUserTel:dic[TEL]];
//            [SystemUse setUserEmail:dic[EMAIL]];
//            [SystemUse setUserSex:dic[SEX]];
//
//            HHTabBarViewController *tabBarController=[[HHTabBarViewController alloc]init];
//            tabBarController.delegate = self;
//            [tabBarController setcontroller:@"Order_VC" title:@"预约" imageNamed:@"search.png" selectedImageName:@"search_.png"];
//            [tabBarController setcontroller:@"History_VC" title:@"历史" imageNamed:@"history.png" selectedImageName:@"history_.png"];
//            [tabBarController setcontroller:@"Setting_VC" title:@"我的" imageNamed:@"more.png" selectedImageName:@"more_.png"];
//            tabBarController.selectedViewController=tabBarController.viewControllers[0];
//            [self presentViewController:tabBarController animated:YES completion:nil];
//        } faile:^(NSError *error) {
//            [self identifyTouch:nil];
//            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"网络错误" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
//                ;
//            }];
//            [alertController addAction:cancelAction];
//            [self presentViewController:alertController animated:YES completion:nil];
//        }];
//    }
//    
    HHTabBarViewController *tabBarController=[[HHTabBarViewController alloc]init];
    tabBarController.delegate = self;
    [tabBarController setcontroller:@"Order_VC" title:@"预约" imageNamed:@"search.png" selectedImageName:@"search_.png"];
    [tabBarController setcontroller:@"History_VC" title:@"历史" imageNamed:@"history.png" selectedImageName:@"history_.png"];
    [tabBarController setcontroller:@"Setting_VC" title:@"我的" imageNamed:@"more.png" selectedImageName:@"more_.png"];
    tabBarController.selectedViewController=tabBarController.viewControllers[0];
    [self presentViewController:tabBarController animated:YES completion:nil];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//http://localhost:8080/HospitalApp/user/UserServlet?action=userInformation&tel=1&pwd=123

@end
