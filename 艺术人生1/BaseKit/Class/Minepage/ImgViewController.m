//
//  ImgViewController.m
//  BaseKit
//
//  Created by GuoYanjun on 2019/1/17.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "ImgViewController.h"
#import "ImageScale.h"

@interface ImgViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) ImageScale *imageScale;
@property (nonatomic, strong) UIImageView *bigImage;

@end

@implementation ImgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 100, 80, 80)];
    [self.view addSubview:imageView];
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.picArr[self.i]]];

    self.imageScale= [ImageScale new];
    [self.imageScale scaleImageView:imageView];
    self.bigImage = imageView;
    
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
