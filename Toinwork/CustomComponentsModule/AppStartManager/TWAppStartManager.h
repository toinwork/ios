//
//  TWAppStartManager.h
//  Toinwork
//
//  Created by zmq on 16/6/26.
//  Copyright © 2016年 Toinwork. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Member;
@interface TWAppStartManager : NSObject
{
    Member *host;
}
@property(nonatomic, strong) UINavigationController *navigationController;

+ (instancetype)sharedInstance;

/**
 *  设置当前登录的用户
 *
 *  @param member 用户对象
 */
-(void)setHost:(Member *)member;

/**
 *  返回当前登录的用户
 *
 *  @return 登录的用户对象
 */
-(Member *)currentHostMember;

/**
 *  app启动后需要做的工作
 */
-(void)didStartApp;

/**
 *  设置当前页为域名页面
 */
-(void)setDomainView;

/**
 *  app退出登录后需要做的工作
 */
-(void)loginout;
@end
