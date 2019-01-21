//
//  MineViewController.m
//  BaseKit
//
//  Created by GuoYanjun on 2018/11/13.
//  Copyright © 2018年 shiyujin. All rights reserved.
//

#import "MineViewController.h"
#import "TABCardView.h"
#import "CardView.h"
#import "ImageScale.h"
#import "ImgViewController.h"

#import "TABDefine.h"
@interface MineViewController ()<TABCardViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong) TABCardView * cardView;
@property (nonatomic, strong) ImageScale *imageScale;
@property (nonatomic, strong) UIImageView *bigImage;


@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"圈友分享";
    
    UIImageView *iimg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-Height_NavBar-Height_TabBar)];
    iimg.image=[UIImage imageNamed:@"bg"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:iimg];
    
    self.cardView = [[TABCardView alloc] initWithFrame:CGRectMake(40, (kScreenHeight - 320)/2, kScreenWidth - 120, 320)
                                       showCardsNumber:4];
    self.cardView.isShowNoDataView = YES;
    self.cardView.noDataView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"占位图"]];
    self.cardView.delegate = self;
    self.imageScale= [ImageScale new];
  
    [self.view addSubview:self.cardView];
    
    // 模拟请求数据
    [self performSelector:@selector(getData) withObject:nil afterDelay:3.0];
}

#pragma mark - Target Method

- (void)getData {
    
    NSArray *imgs=@[@"http://api.tao-yibao.com/Public/Upload/Goods/20190109/thumb_5c35e4cb07176.jpg",
                    @"http://api.tao-yibao.com/Public/Upload/Goods/20181205/thumb_5c079fcbe1a47.jpg",
                    @"http://api.tao-yibao.com/Public/Upload/Goods/20180918/thumb_5ba0657643688.jpg",
                    @"http://api.tao-yibao.com/Public/Upload/Goods/20181105/thumb_5be0060f6d48b.jpg",
                    @"http://api.tao-yibao.com/Public/Upload/Goods/20181029/thumb_5bd6c092ab846.jpg",
                    @"http://api.tao-yibao.com/Public/Upload/Goods/20181105/thumb_5be0024912b01.jpg",
                    @"http://api.tao-yibao.com/Public/Upload/Goods/20181101/thumb_5bda7739dc090.jpg",
                    @"http://api.tao-yibao.com/Public/Upload/Goods/20181207/thumb_5c0a28c7e9c0b.jpg",
                    @"http://api.tao-yibao.com/Public/Upload/Goods/20181029/thumb_5bd6bf4a34811.jpg",
                    @"http://api.tao-yibao.com/Public/Upload/Goods/20181205/thumb_5c079f0f95a46.jpg",];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    WeakSelf(self);
    for (int i = 0; i < imgs.count; i ++) {
        CardView *view = [[CardView alloc] init];
        [view updateViewWithData:[NSString stringWithFormat:@"%@",imgs[i]]];
       

        view.clickBlock = ^(UIImageView * _Nonnull image) {
            [weakself.imageScale scaleImageView:image];
            weakself.bigImage = image;
        };
        [array addObject:view];
    }
    [self.cardView loadCardViewWithData:array];
}

#pragma mark - TABCardViewDelegate

- (void)tabCardViewCurrentIndex:(NSInteger)index {
    NSLog(@"当前处于卡片数组下标:%ld",(long)index);
    
}

@end
