//
//  FristCell.m
//  CollectionLayout
//
//  Created by 范胜利 on 16/6/17.
//  Copyright © 2016年 Soley. All rights reserved.
//

#import "FristCell.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@implementation FristCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"frame == %f",frame.size.width);
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.goodsImage = [[UIImageView alloc]init];
    [self.contentView addSubview:self.goodsImage];
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.goodsImage.frame.size.height-40, 185, 30)];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font = [UIFont systemFontOfSize:17];
    [self.goodsImage addSubview:self.nameLabel];
}
@end
