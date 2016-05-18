//
//  DetailedHistory_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "DetailedHistory_VC.h"
#import "Define.h"
@interface DetailedHistory_VC ()

@end

@implementation DetailedHistory_VC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self showViewWithDic:self.dict];
}

-(void) showViewWithDic:(NSDictionary *) dic{
    self.userName.text = dic[USER_NAME];
    self.doctorName.text = dic[DOCTOR_NAME];
    self.information.text =[NSString stringWithFormat:@"结果：\n   %@",dic[INFORMATION]];
    self.information.editable = NO;
    self.dateTime.text = dic[DATE_TIME];
}



@end