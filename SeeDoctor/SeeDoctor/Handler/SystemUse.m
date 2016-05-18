//
//  SystemUse.m
//  SeeDoctor
//
//  Created by zhao on 16/5/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "SystemUse.h"
#import "Define.h"
@implementation SystemUse


+(void) setUserName:(NSString *)name{
    [[NSUserDefaults standardUserDefaults] setValue:name forKey:USER_NAME];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *) getUserName{
    return [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
}

+(void) setUserTel:(NSString *)tel{
    [[NSUserDefaults standardUserDefaults] setValue:tel forKey:TEL];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *) getUserTel{
    return [[NSUserDefaults standardUserDefaults] objectForKey:TEL];
}


+(void) setUserPwd:(NSString *)pwd{
    [[NSUserDefaults standardUserDefaults] setValue:pwd forKey:PWD];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *) getUserPwd{
    return [[NSUserDefaults standardUserDefaults] objectForKey:PWD];
}

+(void) setUserEmail:(NSString *)email{
    [[NSUserDefaults standardUserDefaults] setValue:email forKey:EMAIL];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *) getUserEmail{
    return [[NSUserDefaults standardUserDefaults] objectForKey:EMAIL];
}

+(void) setUserSex:(NSString *)sex{
    [[NSUserDefaults standardUserDefaults] setValue:sex forKey:SEX];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *) getUserSex{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SEX];
}


@end