//
//  NewsTableViewCell.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/16.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNewsModel:(NewsModel *)newsModel {
    
    _newsModel = newsModel;
    _nameLabel.text = _newsModel.nameStr;
    _titleLabel.text = _newsModel.titleStr;
}

@end
