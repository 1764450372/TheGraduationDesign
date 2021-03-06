//
//  Define_h
//  SeeDoctor
//
//  Created by zhao on 16/5/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define USER_NAME        @"name"
#define DOCTOR_NAME      @"doctorName"
#define DOCTOR_NUM       @"doctorNun"
#define INFORMATION      @"information"
#define DATE_TIME        @"datetime"
#define DEPARTMENT       @"department"
#define DEPARTMENT_NUM   @"departmentNum"
#define DIFFERENT        @"different"
#define PEOPLE_NUM       @"peopleNum"
#define ORDER_NUM        @"orderNum"
#define SEX              @"sex"
#define TEL              @"tel"
#define PWD              @"pwd"
#define EMAIL            @"email"
#define GENDER           @"gender"
#define DOCTOR           @"doctor"


//注册
#define regist @"http://1.hospitalapp.applinzi.com/user/UserServlet?action=regist&tel=%@&name=%@&email=%@&gender=%@&sex=%@&pwd=%@"
//登录
#define checkPassword   @"http://1.hospitalapp.applinzi.com/user/UserServlet?action=login&tel=%@&pwd=%@"
//返回用户信息
#define userInformation @"http://1.hospitalapp.applinzi.com/user/UserServlet?action=userInformation&tel=%@&pwd=%@"
//修改用户信息
#define updateUserInformation  @"http://1.hospitalapp.applinzi.com/user/UserServlet?action=updateUser&tel=%@&name=%@&email=%@&gender=%@&sex=%@&pwd=%@"
//医生信息查询
#define doctorAllSearch @"http://1.hospitalapp.applinzi.com/other/OtherServlet?action=doctorAllSearch"
//部门查询
#define  departmentSearch   @"http://1.hospitalapp.applinzi.com/other/OtherServlet?action=departmentSearch&page=1&count=50"
//部门对应医生
#define  doctorSearch  @"http://1.hospitalapp.applinzi.com/other/OtherServlet?action=doctorSearch&departmentNum=%@&page=1&count=5"
//预约表根据doctor_id 和日期查count------已经预约人数
#define  subscribeCount @"http://1.hospitalapp.applinzi.com/other/OtherServlet?action=subscribeCount&doctor_id=%@&datetime=%@"

//就诊号查询
#define  subscribeCountForId  @"http://1.hospitalapp.applinzi.com/other/OtherServlet?action=subscribeCountForId"
//预约表插入
#define  subscribeInsert @"http://1.hospitalapp.applinzi.com/other/OtherServlet?action=subscribeInsert&id=%@&user_id=%@&doctor_id=%@&different=0&datetime=%@"
//就诊结果查询
#define  reslutSearch   @"http://1.hospitalapp.applinzi.com/other/OtherServlet?action=reslutSearch&user_id=%@"

//查询大夫信息
#define  doctorSearchById   @"http://1.hospitalapp.applinzi.com/other/OtherServlet?action=doctorSearchById&id=%@&page=1&count=5"

//未就诊记录查询
#define subscribeSearch  @"http://1.hospitalapp.applinzi.com/other/OtherServlet?action=subscribeSearch&user_id=%@&different=0"
#endif /* Define_h */
