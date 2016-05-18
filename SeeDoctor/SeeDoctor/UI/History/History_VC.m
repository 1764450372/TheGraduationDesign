//
//  History_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/5.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "History_VC.h"
#import "DetailedHistory_VC.h"
#import "Define.h"
@interface History_VC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation History_VC{
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
              @{@"doctorName":@"李医生",@"userName":@"小王",@"department":@"神经科", @"dataTime":@"2016年5月30日",@"information":@"要死了"},
              @{@"doctorName":@"李医生",@"userName":@"小王",@"department":@"神经科", @"dataTime":@"2016年5月30日",@"information":@"要死了"},
              @{@"doctorName":@"李医生",@"userName":@"小王",@"department":@"神经科", @"dataTime":@"2016年5月30日",@"information":@"要死了"},
              @{@"doctorName":@"李医生",@"userName":@"小王",@"department":@"神经科", @"dataTime":@"2016年5月30日",@"information":@"要死了"}
              ];
    m_tableView.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 100 * [datas count] );
    m_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:m_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [datas count];
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
    label.text = datas[indexPath.row][DEPARTMENT];;
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [view addSubview:label];
    [cell addSubview:view];
    cell.backgroundColor = [UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailedHistory_VC * detailedHistory_vc = [[DetailedHistory_VC alloc] init];
    NSDictionary * dic = datas [indexPath.row];
    detailedHistory_vc.dict = dic;
    [self.navigationController pushViewController:detailedHistory_vc animated:YES];
}



@end
