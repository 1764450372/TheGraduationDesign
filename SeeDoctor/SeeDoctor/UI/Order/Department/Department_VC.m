//
//  Department_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "Department_VC.h"
#import "Define.h"
@interface Department_VC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Department_VC{
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
              @{@"doctorNun":@"1",@"doctorName":@"王医生",@"different":@"0",@"peopleNum":@"9",@"orderNum":@"20",@"sex":@"0"},
              @{@"doctorNun":@"2",@"doctorName":@"李医生",@"different":@"0",@"peopleNum":@"8",@"orderNum":@"20",@"sex":@"1"},
              @{@"doctorNun":@"3",@"doctorName":@"赵医生",@"different":@"1",@"peopleNum":@"11",@"orderNum":@"20",@"sex":@"0"},
              @{@"doctorNun":@"4",@"doctorName":@"吴医生",@"different":@"1",@"peopleNum":@"13",@"orderNum":@"20",@"sex":@"1"}
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
    NSLog(@"预约%@  %@ %@ %@" ,self.departmentNum,datas[indexPath.row][DOCTOR_NUM],datas[indexPath.row][DOCTOR_NAME],datas[indexPath.row][DIFFERENT]);
     
}
@end
