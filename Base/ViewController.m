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
#import <sqlite3.h>
#import "FMDatabase.h"

static sqlite3 * db = nil;

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
    [self createDB];
    [self createHabitsTable];
    [self insertData];
    [self closeDB];
}
-(void)setsubViews
{
    //导航
    GHNaviView * naviView = [[GHNaviView alloc] init];
    [naviView setTitle:@"养成好习惯" leftBtnImage:@"Chat_icon_jianpan" rightBtnImage:@"adressNew_iconfont-bianji"];
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
        
    }
}
#pragma mark - 数据库
//创建
-(void)createDB
{
    NSString * path = [NSString stringWithFormat:@"%@/Documents/data.sqlite",NSHomeDirectory()];
    //后缀 .sqlite   .db  .rdb
    NSFileManager * fm = [NSFileManager defaultManager];
    if (!fm) {
        [fm createFileAtPath:path contents:nil attributes:nil];
    }
    NSLog(@"数据库地址:%@",path);
    sqlite3_open([path UTF8String], &db);
}
-(void)createHabitsTable
{
    NSString * sql = @"create table if not exists Habits(ID INTEGER primary key,title TEXT,currentCount INTEGER,targetCount INTEGER)";
    char * error = nil;
    int result = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &error);
    if (result != SQLITE_OK) {
        NSLog(@"创建失败:%@",[NSString stringWithUTF8String:error]);
    }
}
-(void)insertData
{
    NSString * sql = @"insert into Habits(ID,title,currentCount,targetCount) values(\"1\",\"生活\",\"3\",\"10\")";
    //数据库描述对象
    sqlite3_stmt * stmt = nil;
    int result = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        sqlite3_step(stmt);
        sqlite3_finalize(stmt);
    }
    else {
        NSLog(@"插入数据失败");
    }
}
-(void)updateData
{
    NSString * sql = @"";
}
-(void)deleteData
{
    NSString * sql = @"";

}
-(void)closeDB
{
    if (db) {
        sqlite3_close(db);
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
