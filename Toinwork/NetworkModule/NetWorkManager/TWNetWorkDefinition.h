//
//  TWNetWorkDefinition.h
//  Toinwork
//
//  Created by zmq on 16/6/26.
//  Copyright © 2016年 Toinwork. All rights reserved.
//

#ifndef TWNetWorkDefinition_h
#define TWNetWorkDefinition_h
#import "AFNetworking.h"
#import "NetWorkMacro.h"

typedef enum{
    SUCCESSREQUEST = 200,    //成功
    FAILEDREQUEST = 201,     //失败
    ERRORTYPE = 204,         //错误类型
    PARAMETERSWARN = 205,    //参数警告
    ILLEGALTYPE = 206,       //非法类型
    TOKENEXPIRE = 208        //token过期
}STATUSCODE;
typedef void (^ApiSuccessCallback)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject);
typedef void (^ApiErrorCallback)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject);
typedef void (^ApiFailedCallback)(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error);

#endif /* TWNetWorkDefinition_h */
