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
    NSMutableArray * arraryDatas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    datepicker = [[UIDatePicker alloc] init];
    arraryDatas = [[NSMutableArray alloc] init];
    datepicker.frame = CGRectMake(0,  [UIScreen mainScreen].bounds.size.height -260, [UIScreen mainScreen].bounds.size.width,200);
    datepicker.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2.jpg"]];
    [self.view addSubview:datepicker];
    datepicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    datepicker.datePickerMode = UIDatePickerModeDateAndTime ;
    [datepicker setCalendar:[NSCalendar currentCalendar]];
    [datepicker setDate:[NSDate date]];
    [datepicker setMaximumDate:[self getPriousorLaterDateFromDate:[NSDate date]]];
    [datepicker setMinimumDate:[NSDate date]];
    [self changeDate];
    _peopleNum.text = _dic[PEOPLE_NUM];
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
    NSString * url1 = [NSString stringWithFormat:subscribeCount,_dic[@"id"],[_dateLabel.text substringToIndex:10]];
    url1 = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

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
    [dateFormatter setDateFormat:@"YYYY-MM-dd  HH:mm"];
    NSString *dateEndTime = [dateFormatter stringFromDate:select];
    _dateLabel.text = dateEndTime;
    [self changeOrderNum];
    [self clickSubmitWithDate:[_dateLabel.text substringToIndex:10]];
}

- (IBAction)changeDate:(id)sender {
    [self changeDate];
}
- (void)clickSubmitWithDate:(NSString *)dates{
     NSString * url1 = [NSString stringWithFormat:subscribeSearch,[SystemUse getUserTel]];
    url1 = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [ASRequest requestWithUrl:url1 Complete:^(NSData *data) {
        [arraryDatas removeAllObjects];
        [arraryDatas addObjectsFromArray:[NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil]];
        if (arraryDatas&&[arraryDatas count]>0 ) {
            for (NSDictionary * dict in arraryDatas) {
                if ([dict[@"doctor_id"] isEqualToString:_dic[@"id"]]&&[[dict[@"datetime"] substringToIndex:10] isEqualToString:dates]) {
                    [_submitButton setEnabled: NO];
                    break;
                }else{
                    [_submitButton setEnabled:YES];
                }
            }
        }else{
            [_submitButton setEnabled:YES];
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
- (IBAction)registSure:(id)sender {
    __block NSString * countNo = @"0";
    NSString * url1 = [NSString stringWithFormat:subscribeCountForId];
    url1 = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [ASRequest requestWithUrl:url1 Complete:^(NSData *data) {
        NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
        if (!arr) {
            int num = (arc4random() % 10000);
            countNo = [NSString stringWithFormat:@"%d", num];
        }else{
        countNo = [NSString stringWithFormat:@"%ld",[arr[0][@"count"] integerValue]+1] ;
        }
        NSString * url1 = [NSString stringWithFormat:subscribeInsert,countNo,[SystemUse getUserTel],_dic[@"id"],_dateLabel.text];
        url1 = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

        [ASRequest requestWithUrl:url1 Complete:^(NSData *data) {
            [self changeDate];
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

    } faile:^(NSError *error){
//        int num = (arc4random() % 10000);
//        countNo = [NSString stringWithFormat:@"%d", num];
//        NSString * url1 = [NSString stringWithFormat:subscribeInsert,countNo,[SystemUse getUserTel],_dic[@"id"],_dateLabel.text];
//        url1 = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//
//        [ASRequest requestWithUrl:url1 Complete:^(NSData *data) {
//            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"" message:@"预约成功" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
//                ;
//            }];
//            [alertController addAction:cancelAction];
//            [self presentViewController:alertController animated:YES completion:nil];
//        } faile:^(NSError *error) {
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"预约失败" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
                ;
            }];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
//        }];
    }];
    
    
}
@end
