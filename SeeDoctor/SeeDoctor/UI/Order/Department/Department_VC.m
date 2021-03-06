//
//  Department_VC.m
//  SeeDoctor
//
//  Created by zhao on 16/5/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "Department_VC.h"
#import "Define.h"
#import "ASRequest.h"
#import "Subscribe_VC.h"

@interface Department_VC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Department_VC{
    UITableView * m_tableView;
    NSMutableArray * datas;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    datas = [[NSMutableArray alloc] init];
    m_tableView = [[UITableView alloc] init];
    m_tableView.dataSource = self;
    m_tableView.delegate = self;
    NSString * url1 = [NSString stringWithFormat:doctorSearch,_departmentNum];
    url1 = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [ASRequest requestWithUrl:url1 Complete:^(NSData *data) {
        NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
        [datas addObjectsFromArray:arr];
        [m_tableView reloadData];
    } faile:^(NSError *error) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"该部门暂无医生出诊" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            ;
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
    m_tableView.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -100   );
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
    if ([datas[indexPath.row][SEX] isEqualToString:@"男"]) {
        imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"boy.jpg"]];
    }else{
        imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"girl.jpg"]];
    }
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(110, 5, [UIScreen mainScreen].bounds.size.width - 100, 80)];
    NSString * str = @"";
    if ([datas[indexPath.row][DIFFERENT] isEqualToString:@"1"]) {
        str = @"(专家)";
    }else{
        str = @"(医师)";
    }
    label.text =[NSString stringWithFormat:@"%@%@",datas[indexPath.row][@"name"],str];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    [view addSubview:imageView];
    [view addSubview:label];
    [cell addSubview:view];
    cell.backgroundColor = [UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Subscribe_VC *subscribe = [[Subscribe_VC alloc] init];
    subscribe.dic = datas[indexPath.row];
    NSString * str = @"";
    if ([datas[indexPath.row][DIFFERENT] isEqualToString:@"1"]) {
        str = @"(专家)";
    }
    subscribe.title = [NSString stringWithFormat:@"%@%@",datas[indexPath.row][@"name"],str];
    [self.navigationController pushViewController:subscribe animated:YES];
}
@end
