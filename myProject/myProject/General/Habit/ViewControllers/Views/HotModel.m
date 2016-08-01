//
//  HotModel.m
//  myProject
//
//  Created by lanou罗志聪 on 16/7/30.
//  Copyright © 2016年 Jinfei Chen. All rights reserved.
//

#import "HotModel.h"

@implementation HotModel

#pragma mark  model属性与系统字符相同时，更改方法
- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"id"]) {
        self.idx = [NSString stringWithFormat:@"%@", value];
    }
    if ([key isEqualToString:@"description"]) {
        self.desc = [NSString stringWithFormat:@"%@", value];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
