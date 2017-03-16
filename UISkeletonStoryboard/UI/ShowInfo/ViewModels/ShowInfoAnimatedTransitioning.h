//
//  ShowInfoAnimatedTransitioning.h
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/16.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShowInfoAnimatedTransitioning : NSObject
<
UIViewControllerAnimatedTransitioning
>

// present还是dismiss
@property (nonatomic, assign) BOOL isPresent;

@end
