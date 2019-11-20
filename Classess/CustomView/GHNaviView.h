//
//  GHNaviView.h
//  GoodHabits
//
//  Created by sifangL on 2019/11/9.
//  Copyright © 2019 sifangL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    TypeNormal = 0,

} Type;

typedef void(^ActionBlock)(NSInteger tag);

@interface GHNaviView : UIView

@property (assign ,nonatomic) CGFloat navHeight;
@property (strong ,nonatomic) UIColor * bgColor;
@property (copy ,nonatomic) ActionBlock block;


//方法定制
@property (strong ,nonatomic) NSString * titleStr;
@property (strong ,nonatomic) NSString * leftImage;
@property (strong ,nonatomic) NSString * rightImage;
@property (strong ,nonatomic) NSString * rightTitle;

@property (assign ,nonatomic) BOOL hiddenLeft;
@property (assign ,nonatomic) BOOL hiddenRight;
-(void)setTitle:(NSString *)title leftBtnImage:(NSString *)imageL rightBtnImage:(NSString *)imageR rightTitle:(NSString *)rightTitle;


@end

NS_ASSUME_NONNULL_END
