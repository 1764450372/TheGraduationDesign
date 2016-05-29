//
//  DetailedToday_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "DetailedToday_VC.h"
#import "Define.h"
#import "SystemUse.h"
#import "QRCode.h"
@interface DetailedToday_VC ()

@end

@implementation DetailedToday_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self showViewWithDic:self.dict];
}

-(void) showViewWithDic:(NSDictionary *) dic{
    self.userName.text = [SystemUse getUserName];
    self.doctorName.text = dic[@"name"];
    self.dateTime.text = dic[DATE_TIME];
    QRCode * qr = [[QRCode alloc] init];
    [_qrCodeImageView setImage: [qr createNonInterpolatedUIImageFormCIImage:[qr createQRForString:dic[@"id"]] withSize:250.0f]];
}
@end
