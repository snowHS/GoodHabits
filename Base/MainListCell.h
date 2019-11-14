//
//  MainListCell.h
//  GoodHabits
//
//  Created by sifangL on 2019/11/11.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^ChangeBlock)(NSInteger tag);

@interface MainListCell : UITableViewCell

@property (copy ,nonatomic) ChangeBlock block;

-(void)setCellInfo:(GoodModel *)model;

@end

NS_ASSUME_NONNULL_END
