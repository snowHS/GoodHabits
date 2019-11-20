//
//  NewCountViewController.m
//  GoodHabits
//
//  Created by 晗砂 on 2019/11/20.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import "NewCountViewController.h"

@interface NewCountViewController ()

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
    
    UITextField * nametf = [[UITextField alloc] init];
    nametf.font = [UIFont systemFontOfSize:15];
    nametf.textColor = BlackColor;
    nametf.placeholder = @"请输入计数的标题";
    [view addSubview:nametf];
    [nametf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
    }];

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
