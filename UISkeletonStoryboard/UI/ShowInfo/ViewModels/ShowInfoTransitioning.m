//
//  ShowInfoTransitioning.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/16.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "ShowInfoTransitioning.h"
#import "ShowInfoPresentationController.h"
#import "ShowInfoAnimatedTransitioning.h"

static ShowInfoTransitioning *newInstance = nil;

@implementation ShowInfoTransitioning

#pragma mark -
#pragma mark Singleton

+ (ShowInfoTransitioning *)sharedInstance {
    @synchronized (self) {
        if (newInstance == nil) {
            newInstance = [[ShowInfoTransitioning alloc] init];
        }
    }
    return newInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    @synchronized (self) {
        if (newInstance == nil) {
            newInstance = [super allocWithZone:zone];
        }
    }
    return newInstance;
}

- (id)copy {
    return self;
}

- (id)mutableCopy {
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark -
#pragma mark UIViewControllerTransitioningDelegate

// 设置ShowInfoPresentationController
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0) {
    
    ShowInfoPresentationController *showInfoPresentationController = [[ShowInfoPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return showInfoPresentationController;
}

// 控制器present执行的动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    ShowInfoAnimatedTransitioning *showInfoAnimatedTransitioning = [[ShowInfoAnimatedTransitioning alloc] init];
    // present
    showInfoAnimatedTransitioning.isPresent = YES;
    
    return showInfoAnimatedTransitioning;
}

// 控制器dismiss执行的动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    ShowInfoAnimatedTransitioning *showInfoAnimatedTransitioning = [[ShowInfoAnimatedTransitioning alloc] init];
    // present
    showInfoAnimatedTransitioning.isPresent = NO;
    
    return showInfoAnimatedTransitioning;
}

@end
