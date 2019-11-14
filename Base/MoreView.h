//
//  MoreView.h
//  GoodHabits
//
//  Created by sifangL on 2019/11/12.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoreView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (strong ,nonatomic) UITableView * tab;
@property (assign ,nonatomic) CGFloat tabTop;

@property (strong ,nonatomic) NSMutableArray * dataArray;

@end

NS_ASSUME_NONNULL_END
