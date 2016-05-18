//
//  Login_VC.h
//  SeeDoctor
//
//  Created by zhao on 16/5/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login_VC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *identifyLabel;
@property (weak, nonatomic) IBOutlet UIButton *identifyButton;
- (IBAction)identifyTouch:(id)sender;
- (IBAction)registTouch:(id)sender;
- (IBAction)loginTouch:(id)sender;

@end
