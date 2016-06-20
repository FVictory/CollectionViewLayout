//
//  SupermarketCell.h
//  CollectionLayout
//
//  Created by 范胜利 on 16/6/17.
//  Copyright © 2016年 Soley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HorizontalScrollCellAction;

@protocol HorizontalScrollCellDelegate <NSObject>
-(void)cellSelectedText:(NSString *)text;
@end

@interface SupermarketCell : UICollectionViewCell<UIScrollViewDelegate>

@property (nonatomic, retain) UIScrollView *scrollView;//scrollView

@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UILabel *nameLabel;

@property (nonatomic,strong) id<HorizontalScrollCellDelegate> cellDelegate;
@property (nonatomic,copy)NSString *text;


@end
