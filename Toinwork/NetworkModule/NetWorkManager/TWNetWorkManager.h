//
//  TWNetWorkManager.h
//  Toinwork
//
//  Created by zmq on 16/6/26.
//  Copyright © 2016年 Toinwork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWNetWorkDefinition.h"
@interface TWNetWorkManager : NSObject

+ (instancetype)sharedInstance;

-(void)post:(NSString *)url parameters:(id)parameters success:(ApiSuccessCallback)success error:(ApiErrorCallback)error failed:(ApiFailedCallback)failed;

-(void)get:(NSString *)url parameters:(id)parameters success:(ApiSuccessCallback)success error:(ApiErrorCallback)error failed:(ApiFailedCallback)failed;
@end
