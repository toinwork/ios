//
//  TWNetWorkManager.m
//  Toinwork
//
//  Created by zmq on 16/6/26.
//  Copyright © 2016年 Toinwork. All rights reserved.
//

#import "TWNetWorkManager.h"
#import "AppUtils.h"
#import "TWAppStartManager.h"
static AFHTTPSessionManager *requestManager;
@implementation TWNetWorkManager

+ (instancetype)sharedInstance
{
    static TWNetWorkManager* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [TWNetWorkManager new];
        if (requestManager == nil) {
            requestManager = [AFHTTPSessionManager manager];
            [requestManager.requestSerializer setTimeoutInterval:TimeOut];
        }
    });

    return instance;
}

-(void)post:(NSString *)url parameters:(id)parameters success:(ApiSuccessCallback)success error:(ApiErrorCallback)error failed:(ApiFailedCallback)failed
{
    NSMutableDictionary *para = nil;
    if ([parameters isKindOfClass:[NSDictionary class]]) {
        para = [NSMutableDictionary dictionaryWithDictionary:parameters];
    }
    
    [requestManager POST:url parameters:para progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary* jsonData = (NSDictionary *)responseObject;
        NSInteger code = [[jsonData objectForKey:@"code"] integerValue];
        if (code == SUCCESSREQUEST) {
            success(task,responseObject);
        }else if(code == TOKENEXPIRE){
            [AppUtils showInfo:[jsonData objectForKey:@"msg"]];
            error(task,responseObject);
            [[TWAppStartManager sharedInstance] loginout];
        }else{
            [AppUtils showInfo:[jsonData objectForKey:@"msg"]];
            error(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [AppUtils showInfo:NetWorkConnectFailedDescription];
        failed(task, error);
    }];
}

-(void)get:(NSString *)url parameters:(id)parameters success:(ApiSuccessCallback)success error:(ApiErrorCallback)error failed:(ApiFailedCallback)failed
{
    NSMutableDictionary *para = nil;
    if ([parameters isKindOfClass:[NSDictionary class]]) {
        para = [NSMutableDictionary dictionaryWithDictionary:parameters];
    }
    
    [requestManager GET:url parameters:para progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary* jsonData = (NSDictionary *)responseObject;
        NSInteger code = [[jsonData objectForKey:@"code"] integerValue];
        if (code == SUCCESSREQUEST) {
            success(task,responseObject);
        }else if(code == TOKENEXPIRE){
            [AppUtils showInfo:[jsonData objectForKey:@"msg"]];
            error(task,responseObject);
            [[TWAppStartManager sharedInstance] loginout];
        }else{
            [AppUtils showInfo:[jsonData objectForKey:@"msg"]];
            error(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [AppUtils showInfo:NetWorkConnectFailedDescription];
        failed(task, error);
    }];
}
@end
