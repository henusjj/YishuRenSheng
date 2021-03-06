//
//  AllUrlrequest.m
//  BaseKit
//
//  Created by GuoYanjun on 2018/11/9.
//  Copyright © 2018年 shiyujin. All rights reserved.
//

#import "AllUrlrequest.h"

@implementation AllUrlrequest
+(AllUrlrequest *)Network{
    static AllUrlrequest *Network = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Network = [[AllUrlrequest alloc]init];
    });
    return Network;
}
//登录1
-(void)LoginPostWithUrl:(NSString *)url andParam:(NSDictionary *)param{
    [APIManager manager].delegate = self;
    [[APIManager manager]GET:url andWithParam:@{@"":@""}];
}
//登录2
-(void)LoginRequest{
    [APIManager manager].delegate = self;
    NSString *url = @"https://www.baidu.com";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"app" forKey:@"13"];
    
    [[APIManager manager] GET:url andWithParam:dic];
}


-(void)HomePostWithUrl:(NSString *)url andParam:(NSDictionary *)param{
    [APIManager manager].delegate = self;
    [[APIManager manager]postWithUrl:url paramWithDic:nil];

}
-(void)PostWithUrl:(NSString *)url andParam:(NSDictionary *)param{
    [APIManager manager].delegate = self;
    [[APIManager manager]postWithUrl:url paramWithDic:param];
    
}




#pragma mark 代理回调数据
-(void)requestSucesses:(id)responseData{
//    可以进行同意的数据转模型，返回的是NSDictionary
    if (self.delegate && [self.delegate respondsToSelector:@selector(requestSucesses:)]) {
        [self.delegate requestSucesses:responseData];
    }
}
-(void)requestError:(NSError *)error{
    if (self.delegate && [self.delegate respondsToSelector:@selector(requestError:)]) {
        [self.delegate requestError:error];
    }
}




@end
