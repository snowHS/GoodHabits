//
//  NewCountViewController.m
//  GoodHabits
//
//  Created by 晗砂 on 2019/11/20.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import "NewCountViewController.h"

@interface NewCountViewController ()
{
    UITextField * countTf;
}
@end

@implementation NewCountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"创建计数器";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubviews];
}
-(void)addSubviews
{
    GHNaviView * naviView = [[GHNaviView alloc] init];
    [naviView setTitle:@"创建计数器" leftBtnImage:@"backimage_btn" rightBtnImage:@"" rightTitle:@"保存"];
    WeakObj(self)
    naviView.block = ^(NSInteger tag) {
        if (tag == 0) {
            [selfWeak.navigationController popViewControllerAnimated:YES];
        }
        else {
            //保存
        }
    };
    [self.view addSubview:naviView];
    
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"标题";
    titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(naviView.mas_bottom).offset(16);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
    }];
    
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(5);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    UITextField * nameTf = [[UITextField alloc] init];
    nameTf.font = [UIFont systemFontOfSize:15];
    nameTf.textColor = BlackColor;
    nameTf.placeholder = @"请输入计数的标题";
    [view addSubview:nameTf];
    [nameTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
    }];
    
    UILabel * countLabel = [[UILabel alloc] init];
    countLabel.text = @"目标";
    countLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view.mas_bottom).offset(16);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
    }];
    
    UIView * viewCount = [[UIView alloc] init];
    viewCount.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewCount];
    [viewCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(countLabel.mas_bottom).offset(5);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    countTf = [[UITextField alloc] init];
    countTf.font = [UIFont systemFontOfSize:15];
    countTf.textColor = BlackColor;
    countTf.placeholder = @"请输入目标值";
    countTf.keyboardType = UIKeyboardTypeNumberPad;
    [viewCount addSubview:countTf];
    [countTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(16);
    }];
    
    UIView * btnsView = [[UIView alloc] init];
    [StaticTools setRoundView:btnsView radius:4 borderWidth:0.5 color:RGB(34, 209, 34)];
    [viewCount addSubview:btnsView];
    [btnsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(countTf.mas_right).offset(10);
        make.right.mas_equalTo(-16);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(101);
    }];
    
    UIButton * reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [reduceBtn addTarget:self action:@selector(changeCount:) forControlEvents:UIControlEventTouchUpInside];
    [btnsView addSubview:reduceBtn];
    reduceBtn.tag = 0;
    [reduceBtn setTitle:@"-" forState:UIControlStateNormal];
    [reduceBtn setTitleColor:RGB(34, 209, 34) forState:UIControlStateNormal];
    [reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(btnsView.mas_width).multipliedBy(0.5);
    }];
    UIButton * addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn addTarget:self action:@selector(changeCount:) forControlEvents:UIControlEventTouchUpInside];
    [btnsView addSubview:addBtn];
    addBtn.tag = 1;
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    [addBtn setTitleColor:RGB(34, 209, 34) forState:UIControlStateNormal];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(btnsView.mas_width).multipliedBy(0.5);
    }];
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = RGB(34, 209, 34);
    [btnsView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.center.mas_equalTo(btnsView.center);
        make.width.mas_equalTo(0.5);
    }];
}
-(void)changeCount:(UIButton *)btn
{
    if (btn.tag == 0 && countTf.text.integerValue == 0) return;
    NSInteger count = countTf.text.integerValue;
    count = btn.tag == 0 ? count - 1 : count + 1;
    countTf.text = [NSString stringWithFormat:@"%ld",(long)count];
}
-(void)backAction:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)saveAction:(UIButton *)btn
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
