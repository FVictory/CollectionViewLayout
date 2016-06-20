//
//  SecondCell.m
//  CollectionLayout
//
//  Created by 范胜利 on 16/6/17.
//  Copyright © 2016年 Soley. All rights reserved.
//

#import "SecondCell.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
//以5s为标准匹配(6 为 667 375  5 为 568 320)
// 主屏幕的高度比例
#define KScreen_H_Scale (kScreenH/667)
// 主屏幕的宽度比例
#define KScreen_W_Scale (kScreenW/375)

@implementation SecondCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.goodsImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (kScreenW-20)/2, (kScreenW-20)/2)];
    [self.contentView addSubview:self.goodsImage];
    
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (kScreenW-20)/2+34*KScreen_H_Scale, (kScreenW-20)/2, 21*KScreen_H_Scale)];
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    self.priceLabel.textColor = [UIColor blackColor];
    self.priceLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.priceLabel];
    
    self.detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (kScreenW-20)/2, (kScreenW-20)/2, 34*KScreen_H_Scale)];
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.font = [UIFont systemFontOfSize:13];
    self.detailLabel.backgroundColor = [UIColor clearColor];
    self.detailLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.detailLabel];
    
}

@end
