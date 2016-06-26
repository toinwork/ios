//
//  URLManager.h
//  Toinwork
//
//  Created by zmq on 16/6/26.
//  Copyright © 2016年 Toinwork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLManager : NSObject
{
    NSString *baseURL;
}
+ (instancetype)sharedInstance;

/**
 *  返回域名
 *
 *  @return 域名
 */
-(NSString *)returnBaseUrl;

/**
 *  设置域名
 *
 *  @param url 域名
 */
-(void)setBaseUrl:(NSString *)url;
@end
