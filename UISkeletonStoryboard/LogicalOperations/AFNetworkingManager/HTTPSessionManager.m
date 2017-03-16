//
//  HTTPSessionManager.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/16.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "HTTPSessionManager.h"

@implementation HTTPSessionManager

+ (void)GETRequestWithURL:(NSString *)urlStr parameters:(NSDictionary *)parametersDict progress:(RequestProgressBlock)requestProgressBlock success:(RequestSuccessBlock)requestSuccessBlock failure:(RequestFailureBlock)requestFailureBlock {
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer.timeoutInterval = 20;
    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [sessionManager GET:urlStr parameters:parametersDict progress:^(NSProgress * _Nonnull downloadProgress) {
        
        requestProgressBlock(downloadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        requestSuccessBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        requestFailureBlock(error);
    }];
}

@end
