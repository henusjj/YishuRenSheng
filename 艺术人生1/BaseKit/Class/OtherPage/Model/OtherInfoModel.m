//
//  OtherInfoModel.m
//  BaseKit
//
//  Created by GuoYanjun on 2019/1/16.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "OtherInfoModel.h"

@implementation OtherInfoModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ids":@"id",@"destitle":@"description"};
}
@end
