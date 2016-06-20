//
//  SectionHeaderTwo.m
//  CollectionLayout
//
//  Created by 范胜利 on 16/6/17.
//  Copyright © 2016年 Soley. All rights reserved.
//

#import "SectionHeaderTwo.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
//以5s为标准匹配(6 为 667 375  5 为 568 320)
// 主屏幕的高度比例
#define KScreen_H_Scale (kScreenH/667)
// 主屏幕的宽度比例
#define KScreen_W_Scale (kScreenW/375)

@implementation SectionHeaderTwo

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    self.backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 85*KScreen_H_Scale)];
    [self addSubview:self.backImage];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 41*KScreen_H_Scale, kScreenW, 44*KScreen_H_Scale)];
    view.backgroundColor = [UIColor redColor];
    [self.backImage addSubview:view];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((kScreenW-90*KScreen_W_Scale)/2, 9*KScreen_H_Scale, 90*KScreen_W_Scale, 21*KScreen_H_Scale)];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.text = @"倾情推荐";
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [view addSubview:self.titleLabel];
}

@end
