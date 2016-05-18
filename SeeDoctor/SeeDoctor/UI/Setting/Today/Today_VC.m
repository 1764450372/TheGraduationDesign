//
//  Today_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "Today_VC.h"
#import "Define.h"
#import "DetailedToday_VC.h"
@interface Today_VC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Today_VC{
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
              @{@"doctorName":@"李医生",@"userName":@"小王",@"department":@"神经科", @"dataTime":@"2016年5月30日",@"tel":@"12314153241234"},
              @{@"doctorName":@"李医生",@"userName":@"小王",@"department":@"神经科", @"dataTime":@"2016年5月30日",@"tel":@"12314153241234"},
              @{@"doctorName":@"李医生",@"userName":@"小王",@"department":@"神经科", @"dataTime":@"2016年5月30日",@"tel":@"12314153241234"},
              @{@"doctorName":@"李医生",@"userName":@"小王",@"department":@"神经科", @"dataTime":@"2016年5月30日",@"tel":@"12314153241234"}];
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
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 80, 80)];
    if ([datas[indexPath.row][SEX] isEqualToString:@"1"]) {
        imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"boy.jpg"]];
    }else{
        imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"girl.jpg"]];
    }
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(110, 5, [UIScreen mainScreen].bounds.size.width - 100, 80)];
    NSString * str = @"";
    if ([datas[indexPath.row][DIFFERENT] isEqualToString:@"1"]) {
        str = @"(专家)";
    }
    label.text =[NSString stringWithFormat:@"%@%@%@/%@",datas[indexPath.row][DOCTOR_NAME],str,datas[indexPath.row][PEOPLE_NUM],datas[indexPath.row][ORDER_NUM]] ;
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    
    [view addSubview:imageView];
    [view addSubview:label];
    [cell addSubview:view];
    cell.backgroundColor = [UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailedToday_VC * detailedToday_vc = [[DetailedToday_VC alloc] init];
    NSDictionary * dic = datas [indexPath.row];
    detailedToday_vc.dict = dic;
    [self.navigationController pushViewController:detailedToday_vc animated:YES];
}
@end
