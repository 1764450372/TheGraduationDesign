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
#import "ASRequest.h"
#import "SystemUse.h"

@interface History_VC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation History_VC{
    UITableView * m_tableView;
    NSMutableArray * datas;
    NSMutableArray * doctorArrary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    doctorArrary = [[NSMutableArray alloc] init];
    [doctorArrary addObjectsFromArray:[SystemUse getUserDoctor]];
    m_tableView = [[UITableView alloc] init];
    m_tableView.dataSource = self;
    m_tableView.delegate = self;
    datas = [[NSMutableArray alloc] init];
    m_tableView.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -100   );
    m_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:m_tableView];
}

-(void) viewWillAppear:(BOOL)animated{
    NSString * url1 = [NSString stringWithFormat:reslutSearch,[SystemUse getUserTel]];
    url1 = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [ASRequest requestWithUrl:url1 Complete:^(NSData *data) {
        NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
        [datas removeAllObjects];
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
    NSString * str = @"" ;
    for (NSDictionary * dic in doctorArrary) {
        if ([dic[@"id"] isEqualToString:datas[indexPath.row][@"doctor_id"]] == YES) {
             if ([dic[DIFFERENT] isEqualToString:@"1"]) {
                 str = @"(专家)";
             }else{
                 str = @"(医师)";
             }
        }
    }
    
    label.text = [NSString stringWithFormat:@"%@%@     %@", datas[indexPath.row][@"name"], str,datas[indexPath.row][@"datetime"]];    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
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
    detailedHistory_vc.title = [NSString stringWithFormat:@"%@就诊结果",dic[@"name"]];
    [self.navigationController pushViewController:detailedHistory_vc animated:YES];
}



@end
