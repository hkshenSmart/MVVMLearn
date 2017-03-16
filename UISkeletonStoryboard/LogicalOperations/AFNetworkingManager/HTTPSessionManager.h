//
//  HTTPSessionManager.h
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/16.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^RequestSuccessBlock)(id result);
typedef void(^RequestFailureBlock)(NSError *error);
typedef void(^RequestProgressBlock)(NSProgress *downloadProgress);

@interface HTTPSessionManager : NSObject

+ (void)GETRequestWithURL:(NSString *)urlStr parameters:(NSDictionary *)parametersDict progress:(RequestProgressBlock)requestProgressBlock success:(RequestSuccessBlock)requestSuccessBlock failure:(RequestFailureBlock)requestFailureBlock;

@end
