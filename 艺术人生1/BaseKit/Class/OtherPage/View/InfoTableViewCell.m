//
//  InfoTableViewCell.m
//  BaseKit
//
//  Created by GuoYanjun on 2019/1/16.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "InfoTableViewCell.h"

@interface InfoTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgs;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *dirctitle;
@property (weak, nonatomic) IBOutlet UILabel *liktype;

@end

@implementation InfoTableViewCell

-(void)setModel:(OtherInfoModel *)model{
    [self.imgs sd_setImageWithURL:[NSURL URLWithString:model.picture]];
    self.name.font=font(14);
    self.name.text=[NSString stringWithFormat:@"%@",model.name];
    self.dirctitle.font=font(12);
    self.dirctitle.numberOfLines =1;
    self.dirctitle.text=[NSString stringWithFormat:@"%@",model.destitle];
    self.liktype.font=font(13);
    self.liktype.textColor=[UIColor redColor];
    self.liktype.text=[NSString stringWithFormat:@"%@",model.direction[0]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
