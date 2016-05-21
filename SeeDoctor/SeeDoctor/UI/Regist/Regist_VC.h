//
//  Regist_VC.h
//  SeeDoctor
//
//  Created by zhao on 16/5/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Regist_VC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *ageLabel;
@property (weak, nonatomic) IBOutlet UITextField *telLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField *pwdLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
- (IBAction)changeSex:(id)sender;

- (IBAction)cancelTouch:(id)sender;
- (IBAction)conformTouch:(id)sender;

@end
