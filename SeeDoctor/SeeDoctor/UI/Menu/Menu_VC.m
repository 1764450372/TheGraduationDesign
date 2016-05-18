//
//  Menu_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "Menu_VC.h"
#import "History_VC.h"
#import "Setting_VC.h"
#import "Order_VC.h"
@interface Menu_VC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Menu_VC{
    UITableView * m_tableView;
    NSArray * datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    [self.view setBackgroundColor:[UIColor grayColor]];
    self.title = @"菜   单";
    [self.navigationController setNavigationBarHidden:NO];
    m_tableView = [[UITableView alloc] init];
    m_tableView.dataSource = self;
    m_tableView.delegate = self;
    datas = [[NSArray alloc] init];
    datas = @[@"预约",@"历史",@"设置",@"退出"];
    m_tableView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100 * [datas count] + 130 );
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
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(5, 0,[UIScreen mainScreen].bounds.size.width - 10, 100)];
    view.backgroundColor = [UIColor greenColor];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 100, 90)];
    imageView.backgroundColor = [UIColor yellowColor];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(110, 15, 100, 70)];
    label.text = datas[indexPath.row];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:44];
    UIView * cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width , 2)];
    cellView.backgroundColor = [UIColor whiteColor];
    UIView * celllView = [[UIView alloc] initWithFrame:CGRectMake(0, 98,[UIScreen mainScreen].bounds.size.width , 2)];
    cellView.backgroundColor = [UIColor whiteColor];
    [view addSubview:cellView];
    [view addSubview:celllView];
    [view addSubview:imageView];
    [view addSubview:label];
    [cell addSubview:view];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            Order_VC * order_vc = [[Order_VC alloc] init];
            [self.navigationController pushViewController:order_vc animated:YES];
            break;
        }
        case 1:{
            History_VC * history_vc = [[History_VC alloc] init];
            [self.navigationController pushViewController:history_vc animated:YES];
            break;
        }
        case 2:{
            Setting_VC * setting_vc = [[Setting_VC alloc] init];
            [self.navigationController pushViewController:setting_vc animated:YES];
            break;
        }
        case 3:{
            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
        }
        default:
            break;
    }
}

@end
