//
//  StaticTools.h
//  GoodHabits
//
//  Created by sifangL on 2019/11/9.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StaticTools : NSObject
//加圆角和边框
+ (void)setRoundView:(UIView *)view radius:(CGFloat)radius borderWidth:(CGFloat)width color:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
