//
//  SectionHeaderZero.h
//  CollectionLayout
//
//  Created by 范胜利 on 16/6/17.
//  Copyright © 2016年 Soley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderZero : UICollectionReusableView<UIScrollViewDelegate>

@property (nonatomic, retain) UIScrollView *scrollView;//scrollView

@property (nonatomic, retain) UILabel *imgTitleLabel;//大图上显示的title

@property (nonatomic, retain) UIPageControl *pageControl;//点

@property (nonatomic, assign) NSInteger index;//保存数组长度

@property (nonatomic, retain) NSMutableArray *adArray;//图片数组

@end
