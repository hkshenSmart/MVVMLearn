//
//  ShowInfoTransitioning.h
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/16.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShowInfoTransitioning : NSObject
<
UIViewControllerTransitioningDelegate
>

// 确保presentVC和dismissVC都执行代理动画
+ (ShowInfoTransitioning *)sharedInstance;

@end
