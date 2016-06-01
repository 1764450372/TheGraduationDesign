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
    if([SystemUse getUserName]){
        _userName.text = [SystemUse getUserTel];
    }
    if([SystemUse getUserPwd]){
        _password.text = [SystemUse getUserPwd];
    }
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
    if (_userName.text.length == 0 ) {
        [self identifyTouch:nil];
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"用户名不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else if(_password.text.length == 0 ) {
        [self identifyTouch:nil];
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"密码不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else if(_identifyLabel.text.length == 0 ) {
        [self identifyTouch:nil];
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"验证码不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else if([_identifyLabel.text isEqualToString:_identifyButton.titleLabel.text] == NO) {
        [self identifyTouch:nil];
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"验证码错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        NSString * url = [NSString stringWithFormat:checkPassword,_userName.text,_password.text];
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [ASRequest requestWithUrl:url Complete:^(NSData *data) {
            NSArray * dic = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
            
            if([dic[0][@"loginSuccess"] isEqualToString:@"yes"]){
                NSString * url1 = [NSString stringWithFormat:userInformation,_userName.text,_password.text];
                url1 = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [ASRequest requestWithUrl:url1 Complete:^(NSData *data) {
                    NSArray * dict = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
                    [SystemUse setUserName:dict[0][USER_NAME]];
                    [SystemUse setUserPwd:dict[0][PWD]];
                    [SystemUse setUserTel:dict[0][TEL]];
                    [SystemUse setUserEmail:dict[0][EMAIL]];
                    [SystemUse setUserSex:dict[0][SEX]];
                    [SystemUse setUserGerder:dict[0][GENDER]];

                    HHTabBarViewController *tabBarController=[[HHTabBarViewController alloc]init];
                    tabBarController.delegate = self;
                    [tabBarController setcontroller:@"Order_VC" title:@"预约" imageNamed:@"search.png" selectedImageName:@"search_.png"];
                    [tabBarController setcontroller:@"History_VC" title:@"历史" imageNamed:@"history.png" selectedImageName:@"history_.png"];
                    [tabBarController setcontroller:@"Setting_VC" title:@"我的信息" imageNamed:@"more.png" selectedImageName:@"more_.png"];
                    tabBarController.selectedViewController=tabBarController.viewControllers[0];
                    [self presentViewController:tabBarController animated:YES completion:nil];
                } faile:^(NSError *error) {
                    [self identifyTouch:nil];
                    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"网络错误" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
                        ;
                    }];
                    [alertController addAction:cancelAction];
                    [self presentViewController:alertController animated:YES completion:nil];
                }];
                
                
            }else{
                UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"用户名或密码错误" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
                    ;
                }];
                [alertController addAction:cancelAction];
                [self presentViewController:alertController animated:YES completion:nil];
            }
        } faile:^(NSError *error) {
            [self identifyTouch:nil];
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"网络错误" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
                ;
            }];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
        }];
    }
    
//    HHTabBarViewController *tabBarController=[[HHTabBarViewController alloc]init];
//    tabBarController.delegate = self;
//    [tabBarController setcontroller:@"Order_VC" title:@"预约" imageNamed:@"search.png" selectedImageName:@"search_.png"];
//    [tabBarController setcontroller:@"History_VC" title:@"历史" imageNamed:@"history.png" selectedImageName:@"history_.png"];
//    [tabBarController setcontroller:@"Setting_VC" title:@"我的" imageNamed:@"more.png" selectedImageName:@"more_.png"];
//    tabBarController.selectedViewController=tabBarController.viewControllers[0];
//    [self presentViewController:tabBarController animated:YES completion:nil];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
 

@end
