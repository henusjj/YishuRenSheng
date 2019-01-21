//
//  TableCellScroller.m
//  BaseKit
//
//  Created by GuoYanjun on 2019/1/14.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "TableCellScroller.h"
#import "SDCycleScrollView.h"

@interface TableCellScroller ()<SDCycleScrollViewDelegate>

@end
@implementation TableCellScroller{
    
    UIScrollView *_demoContainerView;

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self craetView];
    }
    return self;
}
-(void)craetView{
   _demoContainerView = [[UIScrollView alloc] init];//WithFrame:self.view.frame];
//    demoContainerView.contentSize = CGSizeMake(self.contentView.frame.size.width, 1200);
    [self.contentView addSubview:_demoContainerView];
    [_demoContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.contentView).offset(0);
        make.height.equalTo(@(Scale(180)));
        
    }];
    
}

-(void)setArryimg:(NSArray *)arryimg{
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 180) shouldInfiniteLoop:YES imageNamesGroup:arryimg];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    [_demoContainerView addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
