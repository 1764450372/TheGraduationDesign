//
//  Regist_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "Regist_VC.h"
#import "ASRequest.h"
#import "Define.h"
#import "SystemUse.h"
@interface Regist_VC ()<UITextFieldDelegate>

@end

@implementation Regist_VC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelTouch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)conformTouch:(id)sender {
    
    if (_nameLabel.text.length == 0 ) {
         UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"用户名不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else if(_pwdLabel.text.length == 0 ) {
         UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"密码不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else if(_ageLabel.text.length == 0 ) {
         UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"年龄不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else if(_telLabel.text.length == 0 ) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"电话不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else if(_emailLabel.text.length == 0 ) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"邮箱不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else if(_sexLabel.text.length == 0 ) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"性别不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        [ASRequest requestWithUrl:@"" Complete:^(NSData *data) {
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
            [SystemUse setUserName:dic[USER_NAME]];
            [SystemUse setUserPwd:dic[PWD]];
            [SystemUse setUserTel:dic[TEL]];
            [SystemUse setUserEmail:dic[EMAIL]];
            [SystemUse setUserSex:dic[SEX]];
            [self dismissViewControllerAnimated:YES completion:nil];
        } faile:^(NSError *error) {
             UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"网络错误" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
                ;
            }];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
        }];
    }
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
