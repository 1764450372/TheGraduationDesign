//
//  Order_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/5.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "Order_VC.h"
#import "Department_VC.h"
#import "Define.h"
#import "ASRequest.h"
#import "SystemUse.h"

@interface Order_VC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Order_VC{
    UITableView * m_tableView;
    NSMutableArray * datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    m_tableView = [[UITableView alloc] init];
    m_tableView.dataSource = self;
    m_tableView.delegate = self;
    datas = [[NSMutableArray alloc] init];
    m_tableView.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -100   );
    m_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:m_tableView];
    NSString * url1 = [NSString stringWithFormat:departmentSearch];
    url1 = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [ASRequest requestWithUrl:url1 Complete:^(NSData *data) {
         NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
        [SystemUse setUserDepartment:arr];
        [datas addObjectsFromArray:arr];
        [m_tableView reloadData];
    } faile:^(NSError *error) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"网络错误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
    NSString * url  = [NSString stringWithFormat:doctorAllSearch];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [ASRequest requestWithUrl:url Complete:^(NSData *data) {
          NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
        [SystemUse setUserDoctor:arr];
    } faile:^(NSError *error) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"网络错误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [datas count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cellIndentefine = @"cellIndentefine";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndentefine];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cellIndentefine];
    }
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(5, 0,[UIScreen mainScreen].bounds.size.width - 10, 90)];
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2.jpg"]];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, [UIScreen mainScreen].bounds.size.width - 10, 80)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = datas[indexPath.row][@"name"];;
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [view addSubview:label];
    [cell addSubview:view];
    cell.backgroundColor = [UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Department_VC * department_vc = [[Department_VC alloc] init];
    department_vc.title = datas[indexPath.row][@"name"];
    department_vc.departmentNum = datas[indexPath.row][@"id"];
    [self.navigationController pushViewController:department_vc animated:YES];
}


@end
