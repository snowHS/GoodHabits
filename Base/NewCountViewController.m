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
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self setNaviItem];
}
-(void)addSubviews
{
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"标题";
    titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(16);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
    }];
    UIView * view = [[UIView alloc] init];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(titleLabel).offset(5);
       make.left.mas_equalTo(16);
       make.height.mas_equalTo(44);
    }];
    UITextField * nametf = [[UITextField alloc] init];
    [view addSubview:nametf];
    [nametf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-17);
    }];

}
-(void)setNaviItem
{
    UIButton * backbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backbtn.frame = CGRectMake(0, 0, 44, 44);
    [backbtn setImage:[UIImage imageNamed:@"backimage_btn"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithCustomView:backbtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIButton * savebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    savebtn.frame = CGRectMake(0, 0, 60, 44);
    savebtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [savebtn setTitleColor:BlackColor forState:UIControlStateNormal];
    savebtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [savebtn setTitle:@"保存" forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * saveItem = [[UIBarButtonItem alloc] initWithCustomView:savebtn];
    self.navigationItem.rightBarButtonItem = saveItem;
    
}
-(void)backAction:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)saveAction:(UIButton *)btn
{
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
