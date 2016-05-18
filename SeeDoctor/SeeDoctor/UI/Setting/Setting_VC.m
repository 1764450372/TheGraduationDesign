//
//  Setting_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/5.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "Setting_VC.h"
#import "Login_VC.h"
#import "About_VC.h"
#import "Modify_VC.h"
#import "Today_VC.h"
@interface Setting_VC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Setting_VC{
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
    datas = @[@"信息修改",@"今日待诊",@"关于我们",@"退       出"];
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
            Modify_VC * modify_vc = [[Modify_VC alloc] init];
            modify_vc.title = datas[indexPath.row];
            [self.navigationController  pushViewController:modify_vc animated:YES];
            break;
        }
        case 1:{
            Today_VC * today_vc = [[Today_VC alloc] init];
            today_vc.title = datas[indexPath.row];
            [self.navigationController  pushViewController:today_vc animated:YES];
            break;
        }
        case 2:{
            About_VC * about_vc = [[About_VC alloc] init];
            about_vc.title = datas[indexPath.row];
            [self.navigationController  pushViewController:about_vc animated:YES];
            break;
        }
        case 3:{
            Login_VC * login_vc = [[Login_VC alloc] init];
            [self presentViewController:login_vc animated:YES completion:nil];
            break;
        }
        default:
            break;
    }
}


@end
