//
//  TWDomainSettingViewController.m
//  Toinwork
//
//  Created by zmq on 16/6/26.
//  Copyright © 2016年 Toinwork. All rights reserved.
//

#import "TWDomainSettingViewController.h"

@interface TWDomainSettingViewController ()
@property(nonatomic, strong) IBOutlet UIView *navigatorView;
@end

@implementation TWDomainSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:ViewControllerBackgroundColor];
    [self.navigatorView setBackgroundColor:NavigatorBackgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
