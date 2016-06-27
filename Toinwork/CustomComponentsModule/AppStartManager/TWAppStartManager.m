//
//  TWAppStartManager.m
//  Toinwork
//
//  Created by zmq on 16/6/26.
//  Copyright © 2016年 Toinwork. All rights reserved.
//

#import "TWAppStartManager.h"
#import "AppDelegate.h"
#import "Member.h"

#import "TWHomeViewController.h"
#import "TWLoginViewController.h"
#import "TWDomainSettingViewController.h"

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
    NSString *domainUrl = [[NSUserDefaults standardUserDefaults] objectForKey:TWK_AppDomainURLKey];
    if (domainUrl) {
        [AppUtils setDomainUrl:domainUrl];
        [self currentHostMember];
        if (host) {
            NSString *isAutoLogin = [[NSUserDefaults standardUserDefaults] objectForKey:TWK_IsAutoLoginKey];
            if ([@"1" isEqualToString:isAutoLogin]) {
                [self setHomeView];
                return;
            }
        }
        [self setLoginView];
    }else{
        [self setDomainView];
    }
}

/**
 *  设置当前页为主页面
 */
-(void)setHomeView
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TWHomeViewController *twHomeVC = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewIdentify"];
    _navigationController = nil;
    _navigationController = [[UINavigationController alloc] initWithRootViewController:twHomeVC];
    [_navigationController setNavigationBarHidden:YES];
    [[(AppDelegate *)[UIApplication sharedApplication].delegate window] setRootViewController:_navigationController];
}

/**
 *  设置当前页为域名页面
 */
-(void)setDomainView
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TWDomainSettingViewController *twDomainSettingVC = [storyboard instantiateViewControllerWithIdentifier:@"DomainSettingViewIdentify"];
    _navigationController = nil;
    _navigationController = [[UINavigationController alloc] initWithRootViewController:twDomainSettingVC];
    [_navigationController setNavigationBarHidden:YES];
    [[(AppDelegate *)[UIApplication sharedApplication].delegate window] setRootViewController:_navigationController];
}

/**
 *  设置当前页为登录页面
 */
-(void)setLoginView
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TWLoginViewController *twLoginVC = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewIdentify"];
    _navigationController = nil;
    _navigationController = [[UINavigationController alloc] initWithRootViewController:twLoginVC];
    [_navigationController setNavigationBarHidden:YES];
    [[(AppDelegate *)[UIApplication sharedApplication].delegate window] setRootViewController:_navigationController];
}

/**
 *  设置当前页为引导页
 */
-(void)setGuidView
{
    
}
/**
 *  app退出登录后需要做的工作
 */
-(void)loginout
{
    [_navigationController popToRootViewControllerAnimated:NO];
    _navigationController = nil;
    [self setLoginView];
    [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:TWK_IsAutoLoginKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
