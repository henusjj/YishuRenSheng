//
//  TableViewCellTwo.h
//  BaseKit
//
//  Created by GuoYanjun on 2019/1/15.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^cliclkBtn)(NSInteger i);
@interface TableViewCellTwo : UITableViewCell
@property(nonatomic,copy)cliclkBtn blockBtn;
@end

NS_ASSUME_NONNULL_END
