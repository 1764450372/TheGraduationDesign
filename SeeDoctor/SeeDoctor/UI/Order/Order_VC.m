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
@interface Order_VC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Order_VC{
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
    datas = @[
              @{@"department":@"神经科",@"departmentNum":@"1"},
              @{@"department":@"妇科",@"departmentNum":@"2"},
              @{@"department":@"儿科",@"departmentNum":@"3"},
              @{@"department":@"皮肤科",@"departmentNum":@"4"}
              ];
    m_tableView.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 100 * [datas count]  );
    m_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:m_tableView];
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
    label.text = datas[indexPath.row][DEPARTMENT];;
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [view addSubview:label];
    [cell addSubview:view];
    cell.backgroundColor = [UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Department_VC * department_vc = [[Department_VC alloc] init];
    department_vc.title = datas[indexPath.row][DEPARTMENT];
    department_vc.departmentNum = datas[indexPath.row][DEPARTMENT_NUM];
    [self.navigationController pushViewController:department_vc animated:YES];
}


@end
