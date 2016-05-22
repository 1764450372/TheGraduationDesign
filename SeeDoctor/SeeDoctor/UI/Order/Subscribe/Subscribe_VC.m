//
//  Subscribe_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/22.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "Subscribe_VC.h"
#import "SystemUse.h"
#import "AsRequest.h"
#import "Define.h"
@interface Subscribe_VC ()

@end

@implementation Subscribe_VC{
    UIDatePicker *datepicker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    datepicker = [[UIDatePicker alloc] init];
    datepicker.frame = CGRectMake(0,  [UIScreen mainScreen].bounds.size.height -260, [UIScreen mainScreen].bounds.size.width,200);
    datepicker.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2.jpg"]];
    [self.view addSubview:datepicker];
    datepicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    datepicker.datePickerMode = UIDatePickerModeDate;
    [datepicker setCalendar:[NSCalendar currentCalendar]];
    [datepicker setDate:[NSDate date]];
    [datepicker setMaximumDate:[self getPriousorLaterDateFromDate:[NSDate date]]];
    [datepicker setMinimumDate:[NSDate date]];
    [self changeDate];
    _peopleNum.text = _dic[ORDER_NUM];
    [datepicker addTarget:self action:@selector(changeDate) forControlEvents:(UIControlEventTouchDown)];
}
-(void) viewWillAppear:(BOOL)animated{
    [self changeDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSDate *)getPriousorLaterDateFromDate:(NSDate *)date

{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setWeekday:7];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
    return mDate;
}


-(void) changeOrderNum{
    NSString * url1 = [NSString stringWithFormat:subscribeCount,_dic[@"id"],_dateLabel.text];
    [ASRequest requestWithUrl:url1 Complete:^(NSData *data) {
        NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
        _orderNum.text = [NSString stringWithFormat:@"%@",arr[0][@"count"]] ;
    } faile:^(NSError *error) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"获取数据失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        _orderNum.text = @"0";
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}

-(void) changeDate{
    NSDate *select  = [datepicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *dateEndTime = [dateFormatter stringFromDate:select];
    _dateLabel.text = dateEndTime;
    [self changeOrderNum];
    NSLog(@"%@",dateEndTime);
}

- (IBAction)changeDate:(id)sender {
    [self changeDate];
}

- (IBAction)registSure:(id)sender {
    __block NSString * countNo = @"0";
    NSString * url = [NSString stringWithFormat:subscribeCountForId];
    [ASRequest requestWithUrl:url Complete:^(NSData *data) {
        NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
        if (!arr) {
            int num = (arc4random() % 10000);
            countNo = [NSString stringWithFormat:@"%d", num];
        }else{
        countNo = [NSString stringWithFormat:@"%d",[arr[0][@"count"] integerValue]+1] ;
        }
        NSString * url1 = [NSString stringWithFormat:subscribeInsert,countNo,[SystemUse getUserTel],_dic[@"id"],_dateLabel.text];
        [ASRequest requestWithUrl:url1 Complete:^(NSData *data) {
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"" message:@"预约成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
                ;
            }];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
        } faile:^(NSError *error) {
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"预约失败" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
                ;
            }];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
        }];

    } faile:^(NSError *error) {
        int num = (arc4random() % 10000);
        countNo = [NSString stringWithFormat:@"%d", num];
        NSString * url1 = [NSString stringWithFormat:subscribeInsert,countNo,[SystemUse getUserTel],_dic[@"id"],_dateLabel.text];
        [ASRequest requestWithUrl:url1 Complete:^(NSData *data) {
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"" message:@"预约成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
                ;
            }];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
        } faile:^(NSError *error) {
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"预约失败" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
                ;
            }];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
        }];

    }];
    
    
}
@end
