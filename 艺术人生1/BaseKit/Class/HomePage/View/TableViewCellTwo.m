//
//  TableViewCellTwo.m
//  BaseKit
//
//  Created by GuoYanjun on 2019/1/15.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "TableViewCellTwo.h"

@interface TableViewCellTwo ()
//@property(nonatomic,strong)UILabel *title;
@end

@implementation TableViewCellTwo

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *title =[[UILabel alloc]init];
        title.text=@"|精品分类";
        title.font=font(15);
        [self.contentView addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(Scale(15));
            make.height.equalTo(@(Scale(15)));
        }];
        UIButton *btn1 =[[UIButton alloc]init];
        btn1.tag=1;
        btn1.layer.borderWidth=0.5;
        btn1.layer.borderColor=[UIColor grayColor].CGColor;
        btn1.layer.cornerRadius = 5;
        [btn1 setBackgroundImage:[UIImage imageNamed:@"timg"] forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(shuhua:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn1];
        [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(title.mas_bottom).offset(Scale(15));
            make.left.equalTo(self.contentView).offset(Scale(ScreenWidth-Scale(150))/4);
            make.height.width.equalTo(@(Scale(50)));
        }];
        UILabel *title1 =[[UILabel alloc]init];
        title1.text=@"书画";
        title1.textAlignment = NSTextAlignmentCenter;
        title1.font=font(13);
        [self.contentView addSubview:title1];
        [title1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn1.mas_left).offset(Scale(0));
            make.height.equalTo(@(Scale(13)));
            make.top.equalTo(btn1.mas_bottom).offset(Scale(6));
            make.right.equalTo(btn1.mas_right).offset(0);
            make.bottom.equalTo(self.contentView).offset(Scale(-10));

        }];
        
        UIButton *btn2 =[[UIButton alloc]init];
        btn2.tag=2;
        btn2.layer.cornerRadius = 5;

        [btn2 setBackgroundImage:[UIImage imageNamed:@"timg-2"] forState:UIControlStateNormal];
        [btn2 addTarget:self action:@selector(shuhua:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn2];
        [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(title.mas_bottom).offset(Scale(10));
            make.left.equalTo(btn1.mas_right).offset(Scale(ScreenWidth-Scale(150))/4);
            make.height.width.equalTo(@(Scale(50)));
        }];
        UILabel *title2 =[[UILabel alloc]init];
        title2.text=@"油画";
        title2.textAlignment = NSTextAlignmentCenter;
        title2.font=font(13);
        [self.contentView addSubview:title2];
        [title2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn2.mas_left).offset(Scale(0));
            make.height.equalTo(@(Scale(13)));
            make.top.equalTo(btn2.mas_bottom).offset(Scale(6));
            make.right.equalTo(btn2.mas_right).offset(0);
            make.bottom.equalTo(self.contentView).offset(Scale(-10));
            
        }];
        
        UIButton *btn3 =[[UIButton alloc]init];
        btn3.tag=3;
        [btn3 setBackgroundImage:[UIImage imageNamed:@"timg-3"] forState:UIControlStateNormal];
        [btn3 addTarget:self action:@selector(shuhua:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn3];
        [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(title.mas_bottom).offset(Scale(10));
            make.right.equalTo(self.contentView).offset(-Scale(ScreenWidth-Scale(150))/4);
            make.height.width.equalTo(@(Scale(50)));
        }];
        UILabel *title3 =[[UILabel alloc]init];
        title3.text=@"水彩";
        title3.textAlignment = NSTextAlignmentCenter;
        title3.font=font(13);
        [self.contentView addSubview:title3];
        [title3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn3.mas_left).offset(Scale(0));
            make.height.equalTo(@(Scale(13)));
            make.top.equalTo(btn3.mas_bottom).offset(Scale(6));
            make.right.equalTo(btn3.mas_right).offset(0);
            make.bottom.equalTo(self.contentView).offset(Scale(-10));
            
        }];
    }
    return self;
}
-(void)shuhua:(UIButton *)sender{
    if (self.blockBtn) {
        self.blockBtn(sender.tag);
    }
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
