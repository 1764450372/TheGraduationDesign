//
//  SystemUse.h
//  SeeDoctor
//
//  Created by zhao on 16/5/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemUse : NSObject

+(void) setUserName:(NSString *)name;

+(NSString *) getUserName;

+(void) setUserTel:(NSString *)tel;

+(NSString *) getUserTel;

+(void) setUserPwd:(NSString *)pwd;

+(NSString *) getUserPwd;

+(void) setUserEmail:(NSString *)email;

+(NSString *) getUserEmail;

+(void) setUserSex:(NSString *)sex;

+(NSString *) getUserSex;

+(void) setUserGerder:(NSString *)gerder;

+(NSString *) getUserGerder;

@end
