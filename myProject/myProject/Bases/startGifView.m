//
//  startGifView.m
//  myProject
//
//  Created by lanou on 16/7/30.
//  Copyright © 2016年 Jinfei Chen. All rights reserved.
//

#import "startGifView.h"
#import "DrawerViewController.h"
#import "FLAnimatedImage.h"

@interface startGifView()

@property (nonatomic,strong)UIWebView *gifView;
@property (nonatomic,strong)UIButton *nextBtn;

@end

@implementation startGifView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *gifPath = [[NSBundle mainBundle]pathForResource:@"start" ofType:@"gif"];
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfFile:gifPath]];
        FLAnimatedImageView *gifImageView = [[FLAnimatedImageView alloc]init];
        gifImageView.animatedImage = image;
        gifImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self addSubview:gifImageView];
        
        // 创建进入按钮
        self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nextBtn.backgroundColor = RGBCOLOR(105,185,156);
        [self.nextBtn setTitle:@"进入体验" forState:UIControlStateNormal];
        self.nextBtn.frame = CGRectMake(SCREEN_WIDTH/3, SCREEN_HEIGHT - 70, SCREEN_WIDTH/3, 40);
        [self.nextBtn addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.nextBtn];
    }
    return self;
}

- (void)nextAction
{
    // 移除界面
    [UIView animateWithDuration:0.5f animations:^{
        self.alpha = 0.f;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
