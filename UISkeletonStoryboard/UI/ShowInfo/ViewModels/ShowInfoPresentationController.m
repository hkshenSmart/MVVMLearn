//
//  ShowInfoPresentationController.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/16.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "ShowInfoPresentationController.h"

@interface ShowInfoPresentationController()

// 底层背景视图
@property (nonatomic, strong) UIView *underView;

@end

@implementation ShowInfoPresentationController

// Begin
- (void)presentationTransitionWillBegin {
    
    self.underView = [[UIView alloc] init];
    self.underView.frame = self.containerView.bounds;
    self.underView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    //self.underView.backgroundColor = [UIColor blackColor];
    [self.containerView addSubview:self.underView];
    
    // 呈现的视图
    self.presentedView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.presentedView];
    
    // 制作underView的动画
    self.underView.frame = CGRectZero;
    __weak ShowInfoPresentationController *weakSelf = self;
    [[self.presentedViewController transitionCoordinator] animateAlongsideTransitionInView:self.underView animation:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        weakSelf.underView.frame = weakSelf.containerView.bounds;
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

// 呈现
- (void)presentationTransitionDidEnd:(BOOL)completed {
    
    // 如果呈现没有完成，那就移除背景underView
    if (!completed) {
        
        [self.underView removeFromSuperview];
    }
}

// 快要销毁
- (void)dismissalTransitionWillBegin {
    
    __weak ShowInfoPresentationController *weakSelf = self;
    [[self.presentingViewController transitionCoordinator] animateAlongsideTransitionInView:self.underView animation:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        weakSelf.underView.frame = CGRectMake(weakSelf.underView.frame.size.width/2, weakSelf.underView.frame.size.height/2, 0, 0);
        //weakSelf.underView.frame = CGRectMake(weakSelf.underView.frame.origin.x, [UIScreen mainScreen].bounds.size.height, weakSelf.underView.frame.size.width, weakSelf.underView.frame.size.height);;
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

// 销毁
- (void)dismissalTransitionDidEnd:(BOOL)completed {
    
    if (completed) {
        
        [self.presentedView removeFromSuperview];
        [self.underView removeFromSuperview];
    }
}

@end
