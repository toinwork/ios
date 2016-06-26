//
//  AppUtils.h
//  DigitalSense
//
//  Created by baolicheng on 16/5/12.
//  Copyright © 2016年 RenRenFenQi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define API_BASE  [AppUtils returnBaseUrl]
@interface AppUtils : NSObject
/**
 *  返回当前app版本信息
 *
 *  @return app版本信息
 */
+ (NSString*) appVersion;

/**
 *  返回当前域名
 *
 *  @return 当前域名
 */
+(NSString *)returnBaseUrl;

/**
 *  提示文字信息
 *
 *  @param text 文字信息
 */
+(void)showInfo:(NSString *)text;

/**
 *  判断字符串是否为空
 *
 *  @param str 字符串
 *
 *  @return YES/空  NO/不能空
 */
+ (BOOL)isNullStr:(NSString *)str;
@end
