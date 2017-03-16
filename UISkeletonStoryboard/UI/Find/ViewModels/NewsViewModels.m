//
//  NewsViewModels.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/16.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "NewsViewModels.h"
#import "HTTPSessionManager.h"
#import "NewsModel.h"

@implementation NewsViewModels

#pragma mark
#pragma mark - Get Data

- (void)getNewsData {
    
    [HTTPSessionManager GETRequestWithURL:@"https://wei.sohu.com/roll/" parameters:nil progress:^(NSProgress *downloadProgress) {
        
    } success:^(id result) {
        //解析result
        NSMutableArray *newsMutableArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i ++) {
            NewsModel *newsModel = [[NewsModel alloc] init];
            newsModel.nameStr = [NSString stringWithFormat:@"天%d", i];
            newsModel.titleStr = [NSString stringWithFormat:@"大好文章%d", i];
            [newsMutableArray addObject:newsModel];
        }
        
        self.newsVMReturnDataBlock(newsMutableArray);
        
    } failure:^(NSError *error) {
        self.newsVMErrorCodeBlock(error);
    }];
}

@end
