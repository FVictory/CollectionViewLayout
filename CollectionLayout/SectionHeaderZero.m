//
//  SectionHeaderZero.m
//  CollectionLayout
//
//  Created by 范胜利 on 16/6/17.
//  Copyright © 2016年 Soley. All rights reserved.
//

#import "SectionHeaderZero.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define AD_SCROLLVIEW_HEIGHT 140*KScreen_H_Scale//广告高度
//以5s为标准匹配(6 为 667 375  5 为 568 320)
// 主屏幕的高度比例
#define KScreen_H_Scale (kScreenH/667)
// 主屏幕的宽度比例
#define KScreen_W_Scale (kScreenW/375)

@implementation SectionHeaderZero

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //数组模型
        self.adArray = [NSMutableArray arrayWithCapacity:0];
        [self.adArray addObject:@"viewpager_0"];
        [self.adArray addObject:@"viewpager_1"];
        [self.adArray addObject:@"viewpager_2"];
        [self.adArray addObject:@"viewpager_3"];
        NSLog(@"1----------%@",self.adArray);
        self.backgroundColor = [UIColor redColor];
        [self createScrollView];
        [self createLabel];
        [self createPageControl];
        
    }
    
    return self;
}

- (void)createScrollView
{
    //定时器 循环
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
    
#pragma mark --UIScrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, AD_SCROLLVIEW_HEIGHT)];
    
    self.scrollView.pagingEnabled = YES;
    
    self.scrollView.userInteractionEnabled = YES;
    
    self.scrollView.scrollEnabled = YES;
    
    self.scrollView.showsVerticalScrollIndicator = FALSE;
    self.scrollView.showsHorizontalScrollIndicator = FALSE;
    
    NSInteger index = self.adArray.count+2;
    
    self.scrollView.contentSize = CGSizeMake((kScreenW*index), AD_SCROLLVIEW_HEIGHT);
    
    _scrollView.delegate = self;
    
    self.scrollView.scrollEnabled = YES;
    
    [self addSubview:self.scrollView];
    
    //    3-[1-2-3]-1 viewpager_0@2x
    
    NSMutableArray *imageViews = [NSMutableArray arrayWithCapacity:0];
    
    
    UIImageView *firstImageView = [[UIImageView alloc] init];
    
    firstImageView.image = [UIImage imageNamed:[_adArray lastObject]];
    
    [imageViews addObject:firstImageView];
    
    for (int i = 0; i < _adArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*kScreenW, 0, kScreenW, AD_SCROLLVIEW_HEIGHT)];
        
        imageView.image = [UIImage imageNamed:_adArray[i]];
        
        [imageViews addObject:imageView];
        
    }
    
    UIImageView *lastImageView = [[UIImageView alloc] init];
    lastImageView.image = [UIImage imageNamed:[_adArray firstObject]];
    [imageViews addObject:lastImageView];
    
    [imageViews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        
        imageView.frame = CGRectMake(kScreenW*idx, 0, kScreenW, AD_SCROLLVIEW_HEIGHT);
        
        [self.scrollView addSubview:imageView];
        
    }];
    
    self.scrollView.contentOffset = CGPointMake(kScreenW, 0);
    
}

- (void)createLabel{
    
    self.imgTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,AD_SCROLLVIEW_HEIGHT - 15, kScreenW, 15)];
    self.imgTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.imgTitleLabel.textColor = [UIColor blackColor];
    self.imgTitleLabel.backgroundColor = [UIColor lightGrayColor];
    self.imgTitleLabel.font = [UIFont systemFontOfSize:13.0];
    self.imgTitleLabel.alpha = 0.5;
    [self addSubview:self.imgTitleLabel];
    
}

- (void)turnPage{
    NSInteger page = self.pageControl.currentPage;
    
    //    if (page == 0) {
    //     获取当前的page
    [self.scrollView scrollRectToVisible:CGRectMake(kScreenW*(page),0,kScreenW,AD_SCROLLVIEW_HEIGHT) animated:NO];
    //    // 触摸pagecontroller那个点点 往后翻一页 +1
    
    //    }
    
    
    CGFloat X = self.scrollView.contentOffset.x;
    X = self.scrollView.contentOffset.x + kScreenW;
    [self.scrollView setContentOffset:CGPointMake(X, 0) animated:YES];
}

- (void)runTimePage
{
    NSInteger page = self.pageControl.currentPage; // 获取当前的page
    page++;
    page = page > self.adArray.count - 1  ? 0 : page ;
    self.pageControl.currentPage = page;
    [self turnPage];
    
}
- (void)createPageControl
{
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.numberOfPages = self.adArray.count;
    
    CGSize pageControSize = [_pageControl sizeForNumberOfPages:self.adArray.count];
    _pageControl.frame = CGRectMake((kScreenW/2 - 39*KScreen_W_Scale/2.0), AD_SCROLLVIEW_HEIGHT - 25*KScreen_H_Scale, 39*KScreen_W_Scale, pageControSize.height*KScreen_H_Scale);
    _pageControl.center = CGPointMake(self.center.x, _pageControl.center.y);
    [self addSubview:self.pageControl];
}


#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/self.frame.size.width;
    
    if (index == 0) {
        index = self.adArray.count - 1;
        scrollView.contentOffset = CGPointMake((self.adArray.count)*kScreenW, 0);
    }else if (index == (self.adArray.count+1)){
        
        index = 0;
        
        scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
    }else{
        index -=1;
    }
    
    self.pageControl.currentPage = index;
}

@end
