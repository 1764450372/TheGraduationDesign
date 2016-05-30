//
//  Subscribe_VC.h
//  SeeDoctor
//
//  Created by zhao on 16/5/22.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Subscribe_VC : UIViewController
@property (nonatomic,copy) NSDictionary * dic;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleNum;
@property (weak, nonatomic) IBOutlet UILabel *orderNum;
- (IBAction)changeDate:(id)sender;
- (IBAction)registSure:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
 

@end
