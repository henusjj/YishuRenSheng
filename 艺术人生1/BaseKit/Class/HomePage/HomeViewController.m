//
//  HomeViewController.m
//  BaseKit
//
//  Created by GuoYanjun on 2018/11/13.
//  Copyright © 2018年 shiyujin. All rights reserved.
//

#import "HomeViewController.h"
#import "TableCellScroller.h"
#import "TableViewCellTwo.h"
#import "CarouselImageCell.h"
#import "TXCarouselCellModel.h"
#import "GuoHuaViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,responseDelegate>
@property (nonatomic, strong) NSMutableArray *array;
//@property ()

@end

@implementation HomeViewController
//页面出现的时候限制重力感应
-(void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"startGyroUpdates" object:nil];
}

//页面消失的时候打开重力限制
- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"turnDowntGyroUpdates" object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    self.tableview.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight-Height_NavBar-Height_TabBar);
    [self.view addSubview: self.tableview];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    
    [self getLoad];
    [self creatFooterView];
}

-(void)getLoad{
    //    http://api.tao-yibao.com/app228.php/index/artistLists
    NetRequest.delegate =self;
    [NetRequest HomePostWithUrl:@"http://api.tao-yibao.com/app228.php/index/artistLists" andParam:@{@"henus":@"h"}];
}

-(void)requestError:(NSError *)error{
    NSLog(@"%@------------",error);

}

-(void)requestSucesses:(id)responseData{
    NSLog(@"%@",responseData);
    
    for (NSDictionary *dic in responseData[@"response"][@"content"]) {
        TXCarouselCellModel *model = [TXCarouselCellModel mj_objectWithKeyValues:dic];
        [self.array addObject:model];
    }
//    NSIndexPath *row=[NSIndexPath indexPathForRow:2 inSection:1];
    [self.tableview reloadData];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *cellid = @"row0";
        TableCellScroller *cell =[tableView dequeueReusableCellWithIdentifier:cellid];
        if (cell ==nil) {
            cell =[[TableCellScroller alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        NSArray *imgs=@[@"1",@"2",@"3",@"4"];
        cell.arryimg = imgs;
        return cell;
    }else if (indexPath.row == 1){
        static NSString *cellid = @"row1";
        TableViewCellTwo *cell =[tableView dequeueReusableCellWithIdentifier:cellid];
        if (cell ==nil) {
            cell =[[TableViewCellTwo alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        WeakSelf(self);
        cell.blockBtn = ^(NSInteger i) {
                GuoHuaViewController *vc =[[GuoHuaViewController alloc]init];
                vc.title=@"作品展览";
                [weakself.navigationController pushViewController:vc animated:YES];
        };
        return cell;
    }else{
        CarouselImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarouselImageCell"];
        if (cell ==nil) {
            cell = [[CarouselImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CarouselImageCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell configData:self.array andSuperScrollView:self.tableview];
        
        
        return  cell;
  
    }
}
//如果同一个tableview出现多个重力的时候，打开当前即将加载的cell 上的重力感应
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        NSDictionary *dict =[[NSDictionary alloc] initWithObjectsAndKeys:@"1",@"openAssignManager",nil];
        NSNotification *notification =[NSNotification notificationWithName:@"openAssignManager" object:nil userInfo:dict];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}

//如果同一个tableview出现多个重力的时候，关闭当前cell上的重力感应
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        NSDictionary *dict =[[NSDictionary alloc] initWithObjectsAndKeys:@"1",@"closeAssignManager",nil];
        NSNotification *notification =[NSNotification notificationWithName:@"closeAssignManager" object:nil userInfo:dict];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
    
    
}

-(void)creatFooterView{
    UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, Scale(230))];
    bgView.backgroundColor = Mycolor(0xf5f5f5);
//    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.equalTo(self.view).offset(0);
//        make.height.equalTo(@(Scale(230)));
//    }];
    
    UIImageView *img =[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"renren"];
    [bgView addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(bgView).offset(0);
        make.height.equalTo(@(Scale(145)));
    }];
    
    UILabel *lable=[[UILabel alloc]init];
    lable.text=@"注：该app所有人物图片,书画图片,均为用于热爱艺术的亲们欣赏,学习,不做任何商业价值。";
    lable.font=font(13);
    lable.numberOfLines = 3;
    lable.backgroundColor = [UIColor whiteColor];
    lable.textColor = [UIColor blueColor];
    [bgView addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(5);
        make.right.equalTo(bgView).offset(-5);
        make.top.equalTo(img.mas_bottom).offset(Scale(5));
        make.bottom.equalTo(bgView).offset(0);
    }];
    self.tableview.tableFooterView = bgView;
    
}

-(void)headerRerefsh{
    [self.tableview.mj_header endRefreshing];
}

-(void)footerRerefsh{
    [self.tableview.mj_footer endRefreshing];

}
-(NSMutableArray *)array
{
    if (!_array) {
        _array = [[NSMutableArray alloc]init];
    }
    return _array;
    
}
@end
