//
//  GuoHuaViewController.m
//  BaseKit
//
//  Created by GuoYanjun on 2019/1/16.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "GuoHuaViewController.h"
#import "HXCollectionViewLayout.h"
#import "HXCollectionViewCell.h"
#import "HXShopItem.h"

@interface GuoHuaViewController ()<responseDelegate,UICollectionViewDelegate , UICollectionViewDataSource,HXCollectionViewLayoutDelegate>
@property(nonatomic,strong) NSMutableArray *shops;
@property(nonatomic,copy)NSString *page;
@end

@implementation GuoHuaViewController{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    HXCollectionViewLayout *layout = [[HXCollectionViewLayout alloc]init];
    layout.delegate = self;
    self.collectionview.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - Height_NavBar);
    self.collectionview.collectionViewLayout = layout;
    self.collectionview.delegate=self;
    self.collectionview.dataSource=self;
    self.collectionview.backgroundColor = [UIColor whiteColor];
    [self.collectionview registerNib:[UINib nibWithNibName:@"HXCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"HXCollectionViewCell"];
    [self.view addSubview:self.collectionview];
    _page =@"1";
    [self getLoad];
}
-(void)getLoad{
    NetRequest.delegate =self;
    
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    [dic setValue:_page forKey:@"p"];
    [NetRequest PostWithUrl:@"http://api.tao-yibao.com/app228.php/Goods/mallList_New" andParam:dic];
}
-(void)requestSucesses:(id)responseData{
    [self.collectionview.mj_footer endRefreshing];

    DLog(@"%@",responseData);
    if (_page.intValue == 1) {
        [self.shops removeAllObjects];
    }
    for (NSDictionary *dic in responseData[@"response"][@"list"]) {
        HXShopItem *model =[HXShopItem mj_objectWithKeyValues:dic];
        [self.shops addObject:model];
    }
    [self.collectionview reloadData];
}

-(void)requestError:(NSError *)error{
     DLog(@"%@",error);
}
-(void)headerRerefsh{
    [self.collectionview.mj_header endRefreshing];
}

-(void)footerRerefsh{
    _page = [NSString stringWithFormat:@"%d",_page.intValue+1];
    [self getLoad];
    
}


#pragma UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    self.collectionview.footer.hidden = self.shops.count == 0;
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HXCollectionViewCell" forIndexPath:indexPath];
    cell.shop = self.shops[indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.view makeToast:@"暂无详情,敬请期待"];

}

#pragma HXCollectionViewLayoutDelegate
- (CGFloat)waterFlowLayout:(HXCollectionViewLayout *)waterFlowLayout heigthForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth {
    
    HXShopItem *shop = self.shops[index];
    return itemWidth * shop.pic_h / shop.pic_w;
}

- (CGFloat)columnCountInWaterflowLayout:(HXCollectionViewLayout *)waterflowLayout {
    return 2;
}
- (CGFloat)columnMarginInWaterflowLayout:(HXCollectionViewLayout *)waterflowLayout {
    return 10;
}
- (CGFloat)rowMarginInWaterflowLayout:(HXCollectionViewLayout *)waterflowLayout {
    return 10;
}
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(HXCollectionViewLayout *)waterflowLayout {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


#pragma 懒加载
- (NSMutableArray *)shops {
    if (!_shops) {
        _shops = [[NSMutableArray alloc]init];
    }
    return _shops;
}


@end
