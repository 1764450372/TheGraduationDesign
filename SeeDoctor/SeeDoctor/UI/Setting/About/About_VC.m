//
//  About_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "About_VC.h"
#import "AboutHospital_VC.h"
#import "AboutDoctor_VC.h"
#import "AboutDepartment_VC.h"

@interface About_VC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation About_VC{
    UITableView * m_tableView;
    NSArray * datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    datas = [[NSArray alloc] init];
    m_tableView = [[UITableView alloc] init];
    m_tableView.dataSource = self;
    m_tableView.delegate = self;
    datas = [[NSArray alloc] init];
    datas = @[@"医院详情",@"科室详情",@"医生简介",@"导诊信息"];
    m_tableView.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 100 * [datas count]);
    m_tableView.backgroundColor = [UIColor clearColor];
    m_tableView.scrollEnabled = NO;
    [self.view addSubview:m_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, [UIScreen mainScreen].bounds.size.width - 10, 80)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = datas[indexPath.row];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [view addSubview:label];
    [cell addSubview:view];
    cell.backgroundColor = [UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            AboutHospital_VC * aboutHospital = [[AboutHospital_VC alloc] init];
            aboutHospital.title = datas[indexPath.row];
            [self.navigationController  pushViewController:aboutHospital animated:YES];
            break;
        }
        case 1:{
            AboutDepartment_VC * aboutDepartment = [[AboutDepartment_VC alloc] init];
            aboutDepartment.title = datas[indexPath.row];
            [self.navigationController  pushViewController:aboutDepartment animated:YES];
            break;
        }
        case 2:{
            AboutDoctor_VC * aboutDoctor = [[AboutDoctor_VC alloc] init];
            aboutDoctor.title = datas[indexPath.row];
            [self.navigationController  pushViewController:aboutDoctor animated:YES];
            break;
        }
        default:
            break;
    }
}

 

@end
