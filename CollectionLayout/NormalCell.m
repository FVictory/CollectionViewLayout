//
//  NormalCell.m
//  CollectionLayout
//
//  Created by 范胜利 on 16/6/17.
//  Copyright © 2016年 Soley. All rights reserved.
//

#import "NormalCell.h"

@implementation NormalCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    UIView *original = [[UIView alloc]initWithFrame:self.frame];
    original.backgroundColor = [UIColor blueColor];
    self.backgroundView = original;
    UIView *select = [[UIView alloc]initWithFrame:self.frame];
    select.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
    [self setSelectedBackgroundView:select];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 20, 20)];
    [self.contentView addSubview:_imageView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.frame.origin.x+_imageView.frame.size.width,20-5, self.frame.size.width-100, 30)];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.tintColor = [UIColor blackColor];
    _nameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_nameLabel];
    
//    self.lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width, 0, 1, 60)];
//    self.lineLabel.backgroundColor = [UIColor blackColor];
//    [self.contentView addSubview:self.lineLabel];
}

@end
