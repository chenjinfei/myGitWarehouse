//
//  AppDelegate.m
//  myProject
//
//  Created by cjf on 7/29/16.
//  Copyright © 2016 Jinfei Chen. All rights reserved.
//

#import "AppDelegate.h"

#import "CJFTabBarViewController.h"
#import "DrawerViewController.h"
#import "LeftViewController.h"
#import "startGifView.h"

@interface AppDelegate ()

@property (nonatomic, strong) DrawerViewController *drawerVc;
@property (nonatomic, strong) UIViewController *mainVc;
@property (nonatomic, strong) LeftViewController *leftVc;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    // 主视图控制器
    self.mainVc = [[CJFTabBarViewController alloc]init];
    // 左视图控制器
    self.leftVc = [[LeftViewController alloc]init];
    // 创建抽屉视图作为根视图控制器
    self.drawerVc = [DrawerViewController drawerWithMainVc:self.mainVc leftVc:self.leftVc leftWidth:SCREEN_WIDTH-80];
    
    // 如果是app第一次启动就加载启动页,如果不是,则直接进入首页
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    // 判断是否第一次
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        startGifView *startDifView = [[startGifView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self.drawerVc.view addSubview:startDifView];
    }
    self.window.rootViewController = self.drawerVc;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
