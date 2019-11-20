//
//  ViewController.m
//  GoodHabits
//
//  Created by sifangL on 2019/11/9.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import "ViewController.h"
#import "MainListCell.h"
#import "GoodModel.h"
#import "MoreView.h"
#import "FMDatabase.h"
#import "NewCountViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong ,nonatomic) UITableView * tab;
@property (strong ,nonatomic) NSMutableArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setsubViews];
    NSDictionary * dic = @{@"keyId":@"1",@"name":@"daydayUp",@"targetCount":@"10",@"currentCount":@"2"};
    GoodModel * model = [[GoodModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    self.dataArray = [@[model] mutableCopy];

}
-(void)setsubViews
{
    //导航
    GHNaviView * naviView = [[GHNaviView alloc] init];
    [naviView setTitle:@"养成好习惯" leftBtnImage:@"Chat_icon_jianpan" rightBtnImage:@"adressNew_iconfont-bianji" rightTitle:@""];
    WeakObj(self)
    naviView.block = ^(NSInteger tag) {
        [selfWeak naviBtnClick:tag];
    };
    [self.view addSubview:naviView];
    
    //列表
    self.tab = [[UITableView alloc] init];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tab];
    [self.tab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(naviView.mas_bottom);
        make.leading.trailing.bottom.mas_equalTo(0);
    }];
    
}
-(void)naviBtnClick:(NSInteger)tag
{
    if (tag == 0) {
        //左按钮
        MoreView * view = [[MoreView alloc] init];
        view.dataArray = [@[@"设置",@"历史记录"] mutableCopy];
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        [window addSubview:view];
    }
    else {
        //add New
        NewCountViewController * vc = [[NewCountViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - TableDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MainListCell"];
    if (!cell) {
        cell = [[MainListCell alloc] init];
    }
    GoodModel * model = self.dataArray[indexPath.row];
    [cell setCellInfo:model];
    cell.block = ^(NSInteger tag) {
    };
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)setDataArray:(NSMutableArray *)dataArray
{
    if (!dataArray) {
        dataArray = [[NSMutableArray alloc] init];
    }
    _dataArray = dataArray;
}
@end
