//
//  MainListCell.m
//  GoodHabits
//
//  Created by sifangL on 2019/11/11.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import "MainListCell.h"

@interface MainListCell ()

@property (strong ,nonatomic) UILabel * titleLabel;
@property (strong ,nonatomic) UILabel * countLabel;
@property (strong ,nonatomic) UIButton * reduceBtn;
@property (strong ,nonatomic) UIButton * increaseBtn;
@property (strong ,nonatomic) GoodModel * modelSelf;

@end

@implementation MainListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        [self addSubviews];
    }
    return self;
}

-(void)changeCountClick:(UIButton *)btn
{
    if (btn.tag == 0) {
        //减
        if (self.modelSelf.currentCount.integerValue == 0) {
            return;
        }
        NSInteger count = self.modelSelf.currentCount.integerValue - 1;
        self.modelSelf.currentCount = [NSString stringWithFormat:@"%zi",count];
    }
    else {
        //加
        if (self.modelSelf.currentCount.integerValue == self.modelSelf.targetCount.integerValue) {
            return;
        }
        self.modelSelf.currentCount = [NSString stringWithFormat:@"%zi",self.modelSelf.currentCount.integerValue + 1];
    }
    [self setCellInfo:self.modelSelf];

    self.block(btn.tag);
}
-(void)setCellInfo:(GoodModel *)model
{
    self.modelSelf = model;
    self.titleLabel.text = self.modelSelf.name;
    NSString * progress = [NSString stringWithFormat:@"%@/%@",self.modelSelf.currentCount,self.modelSelf.targetCount];
    NSRange range = [progress rangeOfString:@"/"];
    NSMutableAttributedString * attr = [[NSMutableAttributedString alloc] initWithString:progress];
    [attr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:60] range:NSMakeRange(0, range.location)];
    [attr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(range.location, attr.length - range.location)];
    self.countLabel.attributedText = attr;
}
#pragma mark - AddSubviews
-(void)addSubviews
{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
    }];
    
    self.reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.reduceBtn.tag = 0;
    [self.reduceBtn setTitle:@"-" forState:UIControlStateNormal];
    [self.reduceBtn setTitleColor:RGB(230, 210, 51) forState:UIControlStateNormal];
    self.reduceBtn.titleLabel.font = [UIFont boldSystemFontOfSize:40];
    [self.contentView addSubview:self.reduceBtn];
    [self.reduceBtn addTarget:self action:@selector(changeCountClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(0);
        make.width.height.mas_equalTo(80);
    }];
    
    self.increaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.increaseBtn.tag = 1;
    [self.increaseBtn setTitle:@"+" forState:UIControlStateNormal];
    [self.increaseBtn setTitleColor:RGB(230, 210, 51) forState:UIControlStateNormal];
    self.increaseBtn.titleLabel.font = [UIFont boldSystemFontOfSize:40];
    [self.contentView addSubview:self.increaseBtn];
    [self.increaseBtn addTarget:self action:@selector(changeCountClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.increaseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-16);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(0);
        make.width.height.mas_equalTo(80);
    }];
    
    self.countLabel = [[UILabel alloc] init];
    self.countLabel.textAlignment = NSTextAlignmentCenter;
    self.countLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.contentView addSubview:self.countLabel];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.reduceBtn.mas_right);
        make.right.mas_equalTo(self.increaseBtn.mas_left);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(0);
        make.height.mas_equalTo(80);
        make.bottom.mas_equalTo(-20);
    }];
    [self.countLabel setContentCompressionResistancePriority:(UILayoutPriorityDefaultLow) forAxis:UILayoutConstraintAxisVertical];
    
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = RGB(229, 229, 229);
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
