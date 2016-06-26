//
//  Member.m
//  Toinwork
//
//  Created by zmq on 16/6/26.
//  Copyright © 2016年 Toinwork. All rights reserved.
//

#import "Member.h"

@implementation Member
-(Member *)initlizedWithDictionary:(NSDictionary *)dic
{
    Member *member = nil;
    if (dic) {
        member = [[Member alloc] init];
        member.token = [dic objectForKey:@"token"];
        member.email = [dic objectForKey:@"email"];
        member.password = [dic objectForKey:@"password"];
    }
    return member;
}

-(NSDictionary *)dictionaryInfo
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (_token) {
        [dic setObject:_token forKey:@"token"];
    }
    
    if (_email) {
        [dic setObject:_email forKey:@"email"];
    }
    
    if (_password) {
        [dic setObject:_password forKey:@"password"];
    }
    
    return [NSDictionary dictionaryWithDictionary:dic];
}

@end
