//
//  MoreView.m
//  GoodHabits
//
//  Created by sifangL on 2019/11/12.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import "MoreView.h"
#define TabH (48 * screenProportionNew)

@implementation MoreView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.backgroundColor = RGBA(0, 0, 0, 0.1);
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
        [self addGestureRecognizer:ges];
        [self addItems];
    }
    return self;
}
-(void)dismiss:(UITapGestureRecognizer *)tap
{
    [self removeFromSuperview];
}
-(void)addItems
{
    self.tab = [[UITableView alloc] init];
    [self addSubview:self.tab];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.backgroundColor = RGBA(255, 255, 255, 0.6);
    [StaticTools setRoundView:self.tab radius:4 borderWidth:1 color:RGB(229, 229, 229)];
    CGFloat top = iPhoneXScreen ? 88 : 64 ;
    [self.tab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(top);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(self.dataArray.count * TabH);
    }];
}
-(void)setTabTop:(CGFloat)tabTop
{
    _tabTop = tabTop;
    [self.tab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tabTop);
    }];
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
    return TabH;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)setDataArray:(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = dataArray;
    }
    _dataArray = dataArray;
    [self.tab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(dataArray.count * TabH);
    }];
    [self.tab reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
