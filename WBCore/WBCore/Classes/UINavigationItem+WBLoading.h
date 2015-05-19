//
//  UINavigationItem+WBLoading.h
//  WBCore
//
//  Created by 成焱 on 15/5/19.
//  Copyright (c) 2015年 成焱. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  活动指示器在导航栏上的位置
 */
typedef NS_ENUM(NSInteger, WBNavigationBarLoaderPosition){
    /**
     *  活动指示器将代替导航栏上面的titleview的位置
     */
    WBNavigationBarLoaderPositionCenter,
    /**
     *  活动指示器代替导航栏上左item的位置
     */
    WBNavigationBarLoaderPositionLeft,
    /**
     *  活动指示器代替导航栏上右item的位置
     */
    WBNavigationBarLoaderPositionRight,
};
@interface UINavigationItem (WBLoading)
/**
 *  开始加载动画
 *
 *  @param position 位置，left, center or right
 */
- (void)startAnimationAt:(WBNavigationBarLoaderPosition)position;
/**
 *  结束动画，移除活动指示器，并恢复原来位置的控件
 */
- (void)stopAnimation;
@end
