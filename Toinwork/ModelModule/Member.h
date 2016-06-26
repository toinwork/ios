//
//  Member.h
//  Toinwork
//
//  Created by zmq on 16/6/26.
//  Copyright © 2016年 Toinwork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Member : NSObject
@property(nonatomic, copy) NSString *token;
@property(nonatomic, copy) NSString *email;
@property(nonatomic, copy) NSString *password;

-(Member *)initlizedWithDictionary:(NSDictionary *)dic;
-(NSDictionary *)dictionaryInfo;
@end
