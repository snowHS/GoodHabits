//
//  GoodModel.m
//  GoodHabits
//
//  Created by sifangL on 2019/11/12.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import "GoodModel.h"

@implementation GoodModel
#pragma mark KVC 安全设置
//key找不到或value为nil,容错处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
- (void)setNilValueForKey:(NSString *)key
{
}
@end
