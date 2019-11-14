//
//  GHNaviView.m
//  GoodHabits
//
//  Created by sifangL on 2019/11/9.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import "GHNaviView.h"

@interface GHNaviView ()

@property (strong ,nonatomic) UILabel * titleLabel;
@property (strong ,nonatomic) UIButton * backBtn;
@property (strong ,nonatomic) UIButton * rightBtn;
@end

@implementation GHNaviView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setDefaultParam];
    }
    return self;
}
#pragma mark - 定制
-(void)setTitle:(NSString *)title leftBtnImage:(NSString *)imageL rightBtnImage:(NSString *)imageR
{
    self.titleStr = title;
    self.leftImage = imageL;
    self.rightImage = imageR;
}

#pragma mark - 默认设置
-(void)setDefaultParam
{
    self.bgColor = RGB(255, 255, 225);

    self.navHeight = 64;
    if (iPhoneXScreen) {
        self.navHeight = 88;
    }
    self.leftImage = @"backimage_btn";
    self.rightImage = @"Chat_icon_jianpan";
    self.hiddenLeft = self.hiddenRight = NO;
    [self setDefaultFunView];
}
-(void)setDefaultFunView
{
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backBtn setImage:[UIImage imageNamed:self.leftImage] forState:UIControlStateNormal];
    [self.backBtn.imageView setContentMode:UIViewContentModeLeft];
    self.backBtn.tag = 0;
    [self.backBtn addTarget:self action:@selector(btnsClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.backBtn];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(6);
        make.width.height.mas_equalTo(44);
        make.bottom.mas_equalTo(0);
    }];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setImage:[UIImage imageNamed:self.rightImage] forState:UIControlStateNormal];
    [self.rightBtn.imageView setContentMode:UIViewContentModeRight];
    self.rightBtn.tag = 1;
    [self.rightBtn addTarget:self action:@selector(btnsClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightBtn];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(-5);
        make.width.height.mas_equalTo(44);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.titleLabel removeFromSuperview];
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;

    [self addSubview:self.titleLabel];
    WeakObj(self)
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(selfWeak.backBtn).offset(0);
        make.trailing.equalTo(selfWeak.rightBtn).offset(0);
        make.height.mas_equalTo(44);
        make.bottom.mas_equalTo(0);
    }];
    
}
#pragma mark - 按钮点击事件
-(void)btnsClick:(UIButton *)btn
{
    self.block(btn.tag);
}
#pragma mark - set方法
-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:RGB(51, 51, 51),NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:16],NSFontAttributeName, nil];
    self.titleLabel.attributedText = [[NSAttributedString alloc] initWithString:titleStr attributes:dic];
}
-(void)setRightImage:(NSString *)rightImage
{
    _rightImage = rightImage;
    [self.rightBtn setImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
    self.rightBtn.hidden = self.hiddenRight;
}
-(void)setLeftImage:(NSString *)leftImage
{
    _leftImage = leftImage;
    [self.backBtn setImage:[UIImage imageNamed:leftImage] forState:UIControlStateNormal];
    self.backBtn.hidden = self.hiddenLeft;
}
-(void)setNavHeight:(CGFloat)navHeight
{
    if (_navHeight) {
        _navHeight = 64;
    }
    _navHeight = navHeight;
    self.frame = CGRectMake(0, 0, ScreenWidth, navHeight);
}
-(void)setBgColor:(UIColor *)bgColor
{
    if (_bgColor) {
        _bgColor = RGB(244, 47, 47);
    }
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
