//
//  ShowInfoAnimatedTransitioning.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/16.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "ShowInfoAnimatedTransitioning.h"

const NSTimeInterval timeDuration = 0.6;

@implementation ShowInfoAnimatedTransitioning

#pragma mark -
#pragma mark UIViewControllerAnimatedTransitioning

// 动画执行的时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return timeDuration;
}

// 实际的动画
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    if (self.isPresent) {
        UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
        presentedView.frame = CGRectMake(presentedView.frame.origin.x, -(presentedView.frame.size.height), presentedView.frame.size.width, presentedView.frame.size.height);
        [UIView animateWithDuration:timeDuration animations:^{
            
            presentedView.frame = CGRectMake(presentedView.frame.origin.x, 0, presentedView.frame.size.width, presentedView.frame.size.height);
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        UIView *presentedView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        //NSLog(@"%@", NSStringFromCGRect(presentedView.frame));
        [UIView animateWithDuration:timeDuration animations:^{
            
            presentedView.frame = CGRectMake(presentedView.frame.origin.x, [UIScreen mainScreen].bounds.size.height, presentedView.frame.size.width, presentedView.frame.size.height);
            //NSLog(@"%@", NSStringFromCGRect(presentedView.frame));
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:YES];
        }];
    }
}

@end
