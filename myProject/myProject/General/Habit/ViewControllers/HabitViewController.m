//
//  HabitViewController.m
//  myProject
//
//  Created by cjf on 7/30/16.
//  Copyright © 2016 Jinfei Chen. All rights reserved.
//

#import "HabitViewController.h"

#import "HotModel.h"

@interface HabitViewController ()

@property (nonatomic, strong) XRCarouselView *carouselView;

@end

@implementation HabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self loadData];
    
//    [self createXRCarousel];
//    
//    [self createScrollView];
    
    
}

#pragma mark 创建 ScrollView
- (void)createScrollView {

    
    
}

#pragma mark 网络加载数据
- (void)loadData {

    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    NSDictionary *parameters = @{
                                 @"detail":@1,
                                 @"flag":@0,
                                 @"prop_num":@10,
                                 @"user_id":@1850878
                                 // detail=1&flag=0&prop_num=10&user_id=1850878
                                 };
    [session POST:APIAllHotNotes parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"ok === %@", responseObject);
        ULog(@"%@", responseObject);
   
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
 
}

#pragma mark 轮播图
- (void)createXRCarousel {

    self.carouselView = [[XRCarouselView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 200)];
    [self.view addSubview:self.carouselView];
    
    self.carouselView.imageArray = @[@"huo2.jpg", @"huo4.jpg", @"huo7.jpg"];
    self.carouselView.time = 2;

//    [carouselView setPageImage:nil andCurrentPageImage:nil];
//    carouselView.pagePosition = CGPointMake(SCREEN_WIDTH - 100, 160);
    
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
