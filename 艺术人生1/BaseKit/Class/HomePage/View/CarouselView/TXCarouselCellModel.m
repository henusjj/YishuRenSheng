//
//  TXCarouselCellModel.m
//  textView
//
//  Created by 新华龙mac on 2018/1/10.
//  Copyright © 2018年 新华龙mac. All rights reserved.
//

#import "TXCarouselCellModel.h"

@implementation TXCarouselCellModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
 
    return @{@"ids":@"id",@"descrTitle":@"description"};
}
@end
