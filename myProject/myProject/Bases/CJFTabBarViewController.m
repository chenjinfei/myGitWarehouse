//
//  CJFTabBarViewController.m
//  myProject
//
//  Created by cjf on 7/29/16.
//  Copyright © 2016 Jinfei Chen. All rights reserved.
//

#import "CJFTabBarViewController.h"

#import "OneViewController.h"
#import "TwoViewController.h"

@interface CJFTabBarViewController ()

@end

@implementation CJFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *oneNav = [self buildViewControllerWithClassName:@"OneViewController" title:@"栏目一" image:@"img_normal" selectedImage:@"img_selected"];
    UINavigationController *twoNav = [self buildViewControllerWithClassName:@"TwoViewController" title:@"栏目二" image:@"img_normal" selectedImage:@"img_selected"];
    
    self.viewControllers = @[oneNav, twoNav];
    
    
}

/**
 *  快速创建导航视图控制器的方法
 *
 *  @param className         视图控制器的类名
 *  @param title             显示在视图控制器的导航标题
 *  @param imageName         视图控制器的标签选项的普通状态图片
 *  @param selectedImageName 视图控制器的标签选项的选中状态图片
 *
 *  @return 导航控制器对象
 */
-(UINavigationController *)buildViewControllerWithClassName:(NSString *)className title: (NSString *)title image:(NSString*)imageName selectedImage: (NSString *)selectedImageName {
    
    UIViewController *newVc = [[NSClassFromString(className) alloc]init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:newVc];
    
    newVc.title = title;
    newVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // first_normalImg = [first_normalImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    newVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return nav;
}

@end
