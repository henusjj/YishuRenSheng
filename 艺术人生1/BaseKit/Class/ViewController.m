//
//  ViewController.m
//  BaseKit
//
//  Created by GuoYanjun on 2018/11/9.
//  Copyright © 2018年 shiyujin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<responseDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
}
-(void)loadData{
    
    NetRequest.delegate =self;
    [NetRequest LoginRequest];
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
