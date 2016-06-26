//
//  TWAppStartManager.m
//  Toinwork
//
//  Created by zmq on 16/6/26.
//  Copyright © 2016年 Toinwork. All rights reserved.
//

#import "TWAppStartManager.h"
#import "Member.h"

#define HostProfilePlist @"PersonProfile.plist"
@implementation TWAppStartManager
+ (instancetype)sharedInstance
{
    static TWAppStartManager* instance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [TWAppStartManager new];
    });

    return instance;
}

/**
 *  设置当前登录的用户
 *
 *  @param member 用户对象
 */
-(void)setHost:(Member *)member
{
    if (member) {
        host = member;
        [self saveProfileToPlist];
    }
}

/**
 *  返回当前登录的用户
 *
 *  @return 登录的用户对象
 */
-(Member *)currentHostMember
{
    if (host == nil) {
        host = [self getProfileFromPlist];
    }
    return host;
}

/**
 *  保存登录用户信息到plist文件
 */
-(void)saveProfileToPlist
{
    NSDictionary *dic = [host dictionaryInfo];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *selfInfoPath = [documentsPath stringByAppendingPathComponent:HostProfilePlist];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:selfInfoPath])
    {
        [[NSFileManager defaultManager] removeItemAtPath:selfInfoPath error:nil];
    }
    
    [dic writeToFile:selfInfoPath atomically:YES];
}

/**
 *  从Local plist获取用户信息
 *
 *  @return 用户信息
 */
-(Member *)getProfileFromPlist
{
    Member *member = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *selfInfoPath = [documentsPath stringByAppendingPathComponent:HostProfilePlist];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:selfInfoPath])
    {
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:selfInfoPath];
        if (dic != nil) {
            member = [[Member alloc] initlizedWithDictionary:dic];
        }
    }
    return member;
}

/**
 *  app启动后需要做的工作
 */
-(void)didStartApp
{
    
}

/**
 *  app退出登录后需要做的工作
 */
-(void)loginout
{
    
}
@end
