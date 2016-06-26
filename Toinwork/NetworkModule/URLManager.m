//
//  URLManager.m
//  Toinwork
//
//  Created by zmq on 16/6/26.
//  Copyright © 2016年 Toinwork. All rights reserved.
//

#import "URLManager.h"

@implementation URLManager

+ (instancetype)sharedInstance
{
    static URLManager* instance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [URLManager new];
    });

    return instance;
}

/**
 *  返回域名
 *
 *  @return 域名
 */
-(NSString *)returnBaseUrl
{
    return baseURL;
}

/**
 *  设置域名
 *
 *  @param url 域名
 */
-(void)setBaseUrl:(NSString *)url
{
    baseURL = url;
}
@end
