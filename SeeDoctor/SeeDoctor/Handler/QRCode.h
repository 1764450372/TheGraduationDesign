//
//  QRCode.h
//  SeeDoctor
//
//  Created by zhao on 16/5/29.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QRCode : NSObject
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size ;
- (CIImage *)createQRForString:(NSString *)qrString ;

@end
