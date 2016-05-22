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

@implementation Regist_VC{
    NSString * strSex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

-(void) viewWillAppear:(BOOL)animated{
    strSex = @"男";
    _segment.selectedSegmentIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeSex:(id)sender {
     if (_segment.selectedSegmentIndex == 0) {
        strSex = @"男";
    }else{
        strSex = @"女";
    }
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
    }else{
        NSString  * url = [NSString  stringWithFormat:regist ,_telLabel.text,_nameLabel.text,_emailLabel.text,_ageLabel.text,strSex,_pwdLabel.text];
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [ASRequest requestWithUrl:url Complete:^(NSData *data) {
            NSArray * dic = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];            
            if([dic[0][@"Successed"] isEqualToString:@"yes"]){
                [SystemUse setUserName:_nameLabel.text];
                [SystemUse setUserPwd:_pwdLabel.text];
                [SystemUse setUserTel:_telLabel.text];
                [SystemUse setUserEmail:_emailLabel.text];
                [SystemUse setUserSex:strSex];
                [SystemUse setUserGerder:_ageLabel.text];
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
                UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"注册失败" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
                    ;
                }];
                [alertController addAction:cancelAction];
                [self presentViewController:alertController animated:YES completion:nil];
            }
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
