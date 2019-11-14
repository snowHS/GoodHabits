//
//  StaticTools.m
//  GoodHabits
//
//  Created by sifangL on 2019/11/9.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import "StaticTools.h"

@implementation StaticTools
#pragma mark - layer
//加圆角和边框
+ (void)setRoundView:(UIView *)view radius:(CGFloat)radius borderWidth:(CGFloat)width color:(UIColor *)color
{
    if (view) {
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = radius;
        view.layer.borderWidth = width;
        if (color) {
            view.layer.borderColor = [color CGColor];
        }
        else {
            view.layer.borderColor = [[UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1] CGColor];
        }
    }
}
@end
