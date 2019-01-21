//
//  InfoListCollectionViewCell.m
//  BaseKit
//
//  Created by GuoYanjun on 2019/1/17.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "InfoListCollectionViewCell.h"

@interface InfoListCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgs;
@property (weak, nonatomic) IBOutlet UILabel *names;

@end

@implementation InfoListCollectionViewCell

- (void)setModel:(OtherInfoModel *)model{
    self.imgs.layer.cornerRadius = 15;
    [self.imgs sd_setImageWithURL:[NSURL URLWithString:model.picture]];
    self.names.text=[NSString stringWithFormat:@"%@",model.name];
    self.names.textAlignment = NSTextAlignmentCenter;
    self.names.font= font(14);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
