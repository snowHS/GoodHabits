//
//  HabitsDefine.h
//  GoodHabits
//
//  Created by sifangL on 2019/11/9.
//  Copyright © 2019 sifangL. All rights reserved.
//

#ifndef HabitsDefine_h
#define HabitsDefine_h

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define iPhoneXScreen (is_iPhoneX || is_iPhoneXSMax || is_iPhoneXR )
#define screenProportionNew  [UIScreen mainScreen].bounds.size.width/375


#define WeakObj(o) __weak typeof(o) o##Weak = o;


#define is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125,2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define is_iPhoneXSMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define is_iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828,1792), [[UIScreen mainScreen] currentMode].size) : NO)

#endif /* HabitsDefine_h */

