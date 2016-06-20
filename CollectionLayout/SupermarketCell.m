//
//  SupermarketCell.m
//  CollectionLayout
//
//  Created by 范胜利 on 16/6/17.
//  Copyright © 2016年 Soley. All rights reserved.
//

#import "SupermarketCell.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
//以5s为标准匹配(6 为 667 375  5 为 568 320)
// 主屏幕的高度比例
#define KScreen_H_Scale (kScreenH/667)
// 主屏幕的宽度比例
#define KScreen_W_Scale (kScreenW/375)

@implementation SupermarketCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    CGFloat xbase = 5;
    CGFloat width = (kScreenW-40)/4;
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height, 110*KScreen_H_Scale)];
    [self.scrollView setScrollEnabled:YES];
    self.scrollView.backgroundColor = [UIColor redColor];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    for(int i = 0; i < 5; i++)
    {
        UIView *custom = [[UIView alloc]initWithFrame:CGRectMake(xbase + (10 + width)*i, 0, width, 110*KScreen_H_Scale)];
        [self.scrollView addSubview:custom];
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, 80*KScreen_H_Scale)];
        self.imageView.backgroundColor = [UIColor greenColor];
        self.imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(handleSingleTap:)];
        [custom addGestureRecognizer:singleFingerTap];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.frame.origin.x,_imageView.frame.origin.y+_imageView.frame.size.height, width, 30*KScreen_H_Scale)];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.tintColor = [UIColor blackColor];
        _nameLabel.backgroundColor = [UIColor blueColor];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"五棵松卓展店";
        [custom addSubview:_nameLabel];
        [custom addSubview:self.imageView];
    }
    [self.scrollView setContentSize:CGSizeMake(width * 5 + 50, self.scrollView.frame.size.height)];
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    UIView *selectedView = (UIView *)recognizer.view;
    for (id object in [selectedView subviews]) {
        if ([object isKindOfClass:[UILabel class]]) {
            UILabel *label = object;
            self.text = label.text;
        }
    }
    if([_cellDelegate respondsToSelector:@selector(cellSelectedText:)])
        [_cellDelegate cellSelectedText:self.text];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate

{
    
}

@end
