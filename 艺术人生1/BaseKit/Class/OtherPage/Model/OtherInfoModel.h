//
//  OtherInfoModel.h
//  BaseKit
//
//  Created by GuoYanjun on 2019/1/16.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OtherInfoModel : NSObject

@property(nonatomic,copy)NSString *ids;
@property(nonatomic,copy)NSString *user_id;

@property(nonatomic,copy)NSString *picture;

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *destitle;
@property(nonatomic,copy)NSArray *direction;

@end

NS_ASSUME_NONNULL_END
