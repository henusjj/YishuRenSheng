//
//  OtherViewController.m
//  BaseKit
//
//  Created by GuoYanjun on 2018/11/13.
//  Copyright © 2018年 shiyujin. All rights reserved.
//

#import "OtherViewController.h"
#import "InfoTableViewCell.h"
#import "OtherInfoModel.h"
#import "infoListViewController.h"

@interface OtherViewController ()<responseDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *arry;
@property(nonatomic,copy)NSString *page;
@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"艺术大家";
//    http://api.tao-yibao.com/app228.php/Artist/artistList?p=1&ss_artist_direction_id=&ss_name=&ss_order=
    _page=@"1";
    self.tableview.delegate =self;
    self.tableview.dataSource=self;
    self.tableview.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight-Height_NavBar-Height_TabBar);
    [self.tableview registerNib:[UINib nibWithNibName:@"InfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"InfoTableViewCell"];
    [self.view addSubview:self.tableview];
    [self getLoad];
}
-(void)getLoad{
    NetRequest.delegate =self;
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:_page forKey:@"p"];
    [NetRequest PostWithUrl:@"http://api.tao-yibao.com/app228.php/Artist/artistList" andParam:dic];
    
    //    http://api.tao-yibao.com/app228.php/Goods/mallList_New
}
-(void)headerRerefsh{
    [self.tableview.mj_header endRefreshing];
}

-(void)footerRerefsh{
    _page = [NSString stringWithFormat:@"%d",_page.intValue+1];
    [self getLoad];
    
}

-(void)requestSucesses:(id)responseData{
    
    DLog(@"%@",responseData);
    if (_page.intValue == 1) {
        [self.arry removeAllObjects];
    }
    NSDictionary *data=responseData[@"response"][@"content"];
    for (NSDictionary *dic in data[@"artist"]) {
        OtherInfoModel *model =[OtherInfoModel mj_objectWithKeyValues:dic];
        [self.arry addObject:model];
    }
    [self.tableview reloadData];
}

-(void)requestError:(NSError *)error{
    DLog(@"%@",error);
}
-(NSMutableArray *)arry{
    if (!_arry) {
        _arry =[[NSMutableArray alloc]init];
    }
    return _arry;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InfoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCell"];
    cell.model=self.arry[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OtherInfoModel *model = self.arry[indexPath.row];
    infoListViewController *vc =[[infoListViewController alloc]init];
    vc.ids = model.ids;
    vc.title=@"代表作品";
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
