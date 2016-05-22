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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    [_telLabel setEnabled: NO];
    _username.text = [SystemUse getUserName];
    _telLabel.text = [SystemUse getUserTel];
    _emailLabel.text = [SystemUse getUserEmail];
    _pwdLabel.text = [SystemUse getUserPwd];
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
        NSString * url = [NSString stringWithFormat:updateUserInformation,[SystemUse getUserTel],_username.text,_emailLabel.text,[SystemUse getUserGerder],[SystemUse getUserSex],_pwdLabel.text];
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [ASRequest requestWithUrl:url Complete:^(NSData *data) {
            [SystemUse setUserPwd:_pwdLabel.text];
            [SystemUse setUserName:_username.text];
            [SystemUse setUserEmail:_emailLabel.text];
            [self.navigationController popViewControllerAnimated:YES];
        } faile:^(NSError *error) {
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"修改失败" preferredStyle:UIAlertControllerStyleAlert];
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
