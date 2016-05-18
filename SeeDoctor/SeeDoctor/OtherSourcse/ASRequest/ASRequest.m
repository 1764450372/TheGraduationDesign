 //
//  ASRequest.m
//  loveLimitFree
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "ASRequest.h"
#import "AFNetworking.h"
@implementation ASRequest
//功能:完成网络请求
//参数:urlString 网址
//    success    请求完成时的回调
//    faliture   请求失败时的回调

+(void) requestWithUrl:(NSString *)urlString Complete:(void (^)(NSData *data))success faile:(void(^)(NSError *error))failture
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //调用success
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failture(error);
    }];
    
}
@end
