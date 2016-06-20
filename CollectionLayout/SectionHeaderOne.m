//
//  SectionHeaderOne.m
//  CollectionLayout
//
//  Created by 范胜利 on 16/6/17.
//  Copyright © 2016年 Soley. All rights reserved.
//

#import "SectionHeaderOne.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
//以5s为标准匹配(6 为 667 375  5 为 568 320)
// 主屏幕的高度比例
#define KScreen_H_Scale (kScreenH/667)
// 主屏幕的宽度比例
#define KScreen_W_Scale (kScreenW/375)

@implementation SectionHeaderOne

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 85*KScreen_H_Scale)];
    [self addSubview:self.backImage];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(113, 30*KScreen_H_Scale, 95, 21*KScreen_H_Scale)];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.text = @"精品荟萃";
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self.backImage addSubview:self.titleLabel];
    
    self.detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 56*KScreen_H_Scale, kScreenW, 21*KScreen_H_Scale)];
    self.detailLabel.text = @"每一种选择，都是别具匠心的精品";
    self.detailLabel.backgroundColor = [UIColor clearColor];
    self.detailLabel.font = [UIFont systemFontOfSize:14];
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
    [self.backImage addSubview:self.detailLabel];
    
}

@end
