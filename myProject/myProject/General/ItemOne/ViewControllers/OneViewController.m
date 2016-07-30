//
//  OneViewController.m
//  myProject
//
//  Created by cjf on 7/29/16.
//  Copyright © 2016 Jinfei Chen. All rights reserved.
//

#import "OneViewController.h"

#import <AFNetworking.h>

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    NSDictionary *parameters = @{@"user_id":@1850878};
    [session POST:@"http://api.idothing.com/zhongzi/v2.php/Habit/getHabitList" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"ok === %@", responseObject);
        ULog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}

@end
