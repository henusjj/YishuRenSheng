//
//  infoListViewController.m
//  BaseKit
//
//  Created by GuoYanjun on 2019/1/16.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "infoListViewController.h"
#import "OtherInfoModel.h"
#import "InfoListCollectionViewCell.h"

@interface infoListViewController ()<responseDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,copy)NSString *page;
@property(nonatomic,strong)NSMutableArray *arry;
@end

@implementation infoListViewController
-(NSMutableArray *)arry{
    if (!_arry) {
        _arry =[[NSMutableArray alloc]init];
    }
    return _arry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _page =@"1";
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    self.collectionview.collectionViewLayout = layout;
    layout.itemSize = CGSizeMake(Scale(180), Scale(250));
    layout.sectionInset=UIEdgeInsetsMake(Scale(1), Scale(1), Scale(1),  Scale(1));
    self.collectionview.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight-Height_NavBar);
    self.collectionview.delegate=self;
    self.collectionview.dataSource=self;
    [self.collectionview registerNib:[UINib nibWithNibName:@"InfoListCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"InfoListCollectionViewCell"];
    self.collectionview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.collectionview];
    [self getLoad];
}
-(void)getLoad{
    NetRequest.delegate =self;
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    [dic setValue:_page forKey:@"p"];
    [dic setValue:_ids forKey:@"id"];
    [NetRequest PostWithUrl:@"http://api.tao-yibao.com/app228.php/Index/artistMaster" andParam:dic];
    //    http://api.tao-yibao.com/app228.php/Goods/mallList_New
}
-(void)requestSucesses:(id)responseData{
    
    DLog(@"%@",responseData);
    if (_page.intValue == 1) {
        [self.arry removeAllObjects];
    }
    for (NSDictionary *dic in responseData[@"response"][@"master"]) {
        OtherInfoModel *model = [OtherInfoModel mj_objectWithKeyValues:dic];
        [self.arry addObject:model];
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

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    InfoListCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"InfoListCollectionViewCell" forIndexPath:indexPath];
    cell.model=self.arry[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arry.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.view makeToast:@"暂无详情,敬请期待"];
}






@end
