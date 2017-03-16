//
//  NewsViewModels.h
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/16.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NewsVMReturnDataBlock)(id returnData);
typedef void (^NewsVMErrorCodeBlock)(id errorCode);

@interface NewsViewModels : NSObject

@property (nonatomic, copy) NewsVMReturnDataBlock newsVMReturnDataBlock;
@property (nonatomic, copy) NewsVMErrorCodeBlock newsVMErrorCodeBlock;

- (void)getNewsData;

@end
