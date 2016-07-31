//
//  LoginViewController.m
//  myProject
//
//  Created by cjf on 7/30/16.
//  Copyright © 2016 Jinfei Chen. All rights reserved.
//

#import "LoginViewController.h"

#import "RegisterByPhoneViewController.h"
#import "UserManager.h"


@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 帐号：18716304714
    // 密码：abc1234567890
    
}

// 登录
- (IBAction)loginClick:(UIButton *)sender {
    NSDictionary *parameters = @{
                                 @"account": [NSNumber numberWithInteger:[self.phoneNumber.text integerValue]],
                                 @"password": self.password.text,
                                 @"account_type": @1
                                 };
    [[UserManager manager] loginWithInfo:parameters success:^(NSDictionary *userData) {
        [self dismissViewControllerAnimated:YES completion:^{
            NSLog(@"登录成功");
        }];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

// 注册
- (IBAction)registerClick:(UIButton *)sender {
    RegisterByPhoneViewController *registerVc = [[RegisterByPhoneViewController alloc]init];
    [self presentViewController:registerVc animated:YES completion:^{
        
    }];
}

- (IBAction)emailLoginClick:(UIButton *)sender {
}

@end
