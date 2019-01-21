//
//  TXCustomCarouselCell.m
//  textView
//
//  Created by 新华龙mac on 2018/1/11.
//  Copyright © 2018年 新华龙mac. All rights reserved.
//

#import "CarouselImageCell.h"
#import "TXCarouselView.h"

@interface CarouselImageCell()

@property (strong, nonatomic)TXCarouselView *carouselView;
@property (nonatomic, strong) NSMutableDictionary *carouselDict;
@end

@implementation CarouselImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *title =[[UILabel alloc]init];
        title.text=@"|优秀作者";
        title.font=font(15);
        [self.contentView addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(Scale(15));
            make.height.equalTo(@(Scale(15)));
        }];
        
        self.carouselView =[[TXCarouselView alloc]init];
        [self.contentView addSubview:self.carouselView];
        [self.carouselView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView).offset(0);
            make.top.equalTo(title.mas_bottom).offset(Scale(15));
            make.height.equalTo(@(Scale(180)));
            make.bottom.equalTo(self.contentView).offset(Scale(-15));
        }];
    }
    return self;
}

-(void)configData:(NSArray <TXCarouselCellModel*>*)modelArray andSuperScrollView:(UIScrollView *)superScrollView;
{
    [self.carouselView setArrayData:modelArray andSuperScrollView:superScrollView];
    [self.carouselView reloadCarouselView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
