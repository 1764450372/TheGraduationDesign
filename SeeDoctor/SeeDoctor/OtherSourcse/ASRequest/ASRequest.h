//
//  ASRequest.h
//  loveLimitFree
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASRequest : NSObject
+(void) requestWithUrl:(NSString *)urlString Complete:(void (^)(NSData *data))success faile:(void(^)(NSError *error))failture;
@end
