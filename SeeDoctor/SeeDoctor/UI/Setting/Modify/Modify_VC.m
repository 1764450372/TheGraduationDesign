//
//  Modify_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "Modify_VC.h"
#import "SystemUse.h"
#import "Define.h"
#import "ASRequest.h"
@interface Modify_VC ()<UITextFieldDelegate>

@end

@implementation Modify_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 

- (IBAction)click:(id)sender {
     if(_telLabel.text.length == 0 ) {
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
    }else if(_sureLabel.text.length == 0 ) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"确认密码不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
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
    }else if([_pwdLabel.text isEqualToString:_sureLabel.text] == NO ) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"两次输入密码不同，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
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
