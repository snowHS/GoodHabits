//
//  GoodModel.h
//  GoodHabits
//
//  Created by sifangL on 2019/11/12.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodModel : NSObject

@property (strong ,nonatomic) NSString * keyId;
@property (strong ,nonatomic) NSString * name;
@property (strong ,nonatomic) NSString * targetCount;
@property (strong ,nonatomic) NSString * currentCount;
@property (strong ,nonatomic) NSString * remarks;


@end

NS_ASSUME_NONNULL_END
