//
//  UINavigationItem+WBLoading.m
//  WBCore
//
//  Created by 成焱 on 15/5/19.
//  Copyright (c) 2015年 成焱. All rights reserved.
//

#import "UINavigationItem+WBLoading.h"
#import <objc/runtime.h>
static void *WBPositionAssociationKey = &WBPositionAssociationKey;
static void *WBSubstituteAssociationKey = &WBSubstituteAssociationKey;

@implementation UINavigationItem (WBLoading)
- (void)startAnimationAt:(WBNavigationBarLoaderPosition)position
{
    [self stopAnimation];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    objc_setAssociatedObject(self, WBPositionAssociationKey, @(position), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    switch (position) {
        case WBNavigationBarLoaderPositionCenter:{
            objc_setAssociatedObject(self, WBSubstituteAssociationKey, self.titleView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.titleView = indicatorView;
        }
            break;
        case WBNavigationBarLoaderPositionLeft:{
            objc_setAssociatedObject(self, WBSubstituteAssociationKey, self.leftBarButtonItem.customView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.leftBarButtonItem.customView = indicatorView;
        }
            break;
        case WBNavigationBarLoaderPositionRight:{
            objc_setAssociatedObject(self, WBSubstituteAssociationKey, self.rightBarButtonItem.customView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.rightBarButtonItem.customView = indicatorView;
        }
            break;
        default:
            break;
    }
    [indicatorView startAnimating];
}

- (void)stopAnimation
{
    NSNumber *position = objc_getAssociatedObject(self, WBPositionAssociationKey);
    id customView = objc_getAssociatedObject(self, WBSubstituteAssociationKey);
    if (position) {
        switch (position.intValue) {
            case WBNavigationBarLoaderPositionCenter:{
                self.titleView = customView;
            }
                break;
            case WBNavigationBarLoaderPositionLeft:{
                self.leftBarButtonItem.customView = customView;
            }
                break;
            case WBNavigationBarLoaderPositionRight:{
                self.rightBarButtonItem.customView = customView;
            }
                break;
            default:
                break;
        }
    }
    objc_setAssociatedObject(self, WBPositionAssociationKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, WBSubstituteAssociationKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
