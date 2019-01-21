//
//  MainTabBarController.m
//  BaseKit
//
//  Created by GuoYanjun on 2018/11/13.
//  Copyright © 2018年 shiyujin. All rights reserved.
//

#import "MainTabBarController.h"
//view Controllers
#import "HomeViewController.h"
#import "MineViewController.h"
#import "OtherViewController.h"
#import "BaseNavController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

-(CYLTabBarController *)mainViewController{
    if (!_mainViewController) {
        UIEdgeInsets imagesInsets = UIEdgeInsetsZero;
        UIOffset titlePosition =UIOffsetZero;
        _mainViewController = [[CYLTabBarController alloc]initWithViewControllers:[self arryViewcontrollers] tabBarItemsAttributes:[self arrayAttributesItem] imageInsets:imagesInsets titlePositionAdjustment:titlePosition];
        [_mainViewController setTintColor:[UIColor colorWithHexString:@"7E8BA7"]];

    }
    return _mainViewController;
}

-(NSArray *)arryViewcontrollers{
    HomeViewController *homevc=[[HomeViewController alloc]init];
    UIViewController *homeNav = [[BaseNavController alloc]initWithRootViewController:homevc];
    
    MineViewController *minevc=[[MineViewController alloc]init];
    UIViewController *mineNav = [[BaseNavController alloc]initWithRootViewController:minevc];
    
    OtherViewController *othervc=[[OtherViewController alloc]init];
    UIViewController *otherNav=[[BaseNavController alloc]initWithRootViewController:othervc];
    
    NSArray *arryviews=@[homeNav,otherNav,mineNav];
    return arryviews;
}

- (NSArray *)arrayAttributesItem{
    NSDictionary *hometar = @{
                              CYLTabBarItemTitle:@"首页",
                              CYLTabBarItemImage:@"bar_home",
                              CYLTabBarItemSelectedImage:@"bar_home_selected",
                              };
    NSDictionary *othertar = @{
                              CYLTabBarItemTitle:@"艺术大家",
                              CYLTabBarItemImage:@"bar_project",
                              CYLTabBarItemSelectedImage:@"bar_project_selected",
                              };
    NSDictionary *minetar = @{
                              CYLTabBarItemTitle:@"分享",
                              CYLTabBarItemImage:@"bar_mine",
                              CYLTabBarItemSelectedImage:@"bar_mine_selected",
                              };
    NSArray *arry = @[hometar,othertar,minetar];
    return arry;
}

@end
