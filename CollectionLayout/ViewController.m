//
//  ViewController.m
//  CollectionLayout
//
//  Created by 范胜利 on 16/6/16.
//  Copyright © 2016年 Soley. All rights reserved.
//

#import "ViewController.h"
#import "FristCell.h"
#import "SecondCell.h"
#import "SectionHeaderOne.h"
#import "SectionHeaderTwo.h"
#import "SectionHeaderZero.h"
#import "NormalCell.h"
#import "SupermarketCell.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
//以5s为标准匹配(6 为 667 375  5 为 568 320)
// 主屏幕的高度比例
#define KScreen_H_Scale (kScreenH/667)
// 主屏幕的宽度比例
#define KScreen_W_Scale (kScreenW/375)


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,HorizontalScrollCellDelegate>

@property (nonatomic,strong)UICollectionView *myCollection;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCollection];
}

- (void)initCollection{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.minimumInteritemSpacing=10;
    layout.minimumLineSpacing=10;
    self.myCollection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.myCollection.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myCollection];
    self.myCollection.delegate = self;
    self.myCollection.dataSource = self;
    [self.myCollection registerClass:[FristCell class] forCellWithReuseIdentifier:@"FristCell"];
    [self.myCollection registerClass:[SecondCell class] forCellWithReuseIdentifier:@"SecondCell"];
    [self.myCollection registerClass:[NormalCell class] forCellWithReuseIdentifier:@"NormalCell"];
    [self.myCollection registerClass:[SupermarketCell class] forCellWithReuseIdentifier:@"SupermarketCell"];
    
    //注册sectionHeader
    [self.myCollection registerClass:UICollectionReusableView.self forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID"];
    [self.myCollection registerClass:[SectionHeaderZero class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderZero"];
    
    [self.myCollection registerClass:[SectionHeaderOne class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderOne"];
    [self.myCollection registerClass:[SectionHeaderTwo class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderTwo"];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //每一个cell的大小
    if(indexPath.section==0){
        return CGSizeZero;
    }else if (indexPath.section == 1){
        CGFloat width=(kScreenW-20)/2;
        return CGSizeMake(width, 60*KScreen_H_Scale);
    }else if (indexPath.section == 2){
        return CGSizeMake(20, 200*KScreen_H_Scale+10);
    }else if (indexPath.section == 3){
        CGFloat smallWidth = (kScreenW-40)/4;
        return CGSizeMake(smallWidth, 110*KScreen_H_Scale);
    }else{
        CGFloat width=(kScreenW-20)/2;
        return CGSizeMake(width, (kScreenW-20)/2+34*KScreen_H_Scale+23*KScreen_H_Scale);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if(section==0){
        [collectionView.collectionViewLayout invalidateLayout];
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    if(section==1){
        return UIEdgeInsetsMake(10, 5, 10, 5);
    }
    return UIEdgeInsetsMake(10, 5, 10, 5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    // 设置sectionHeader的size
    if(section==0){
        return  CGSizeMake(kScreenW, 140*KScreen_H_Scale);
    }else if (section == 1){
        CGSize size = CGSizeMake(kScreenW, 10*KScreen_H_Scale);
        return size;
    }else if (section == 2){
        CGSize size = CGSizeMake(kScreenW, 10*KScreen_H_Scale);
        return size;
    }else{
        CGSize size = CGSizeMake(kScreenW, 85*KScreen_H_Scale);
        return size;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //设置sectionHeader
    if(indexPath.section==0){
        SectionHeaderZero* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderZero" forIndexPath:indexPath];
        return headerView;
    }
    if(indexPath.section==1){
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID" forIndexPath:indexPath];
        view.backgroundColor=[UIColor purpleColor];
        return view;
    }else if (indexPath.section == 2){
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID" forIndexPath:indexPath];
        view.backgroundColor=[UIColor purpleColor];
        return view;
    }else if (indexPath.section == 3){
        SectionHeaderOne *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderOne" forIndexPath:indexPath];
        view.backImage.backgroundColor=[UIColor purpleColor];
        return view;
    }else{
        SectionHeaderTwo * header= [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderTwo" forIndexPath:indexPath];
        
        header.backImage.backgroundColor=[UIColor yellowColor];
        return header;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 0){
        return 0;
    }
    if(section==1){
        return 2;
    }else if (section == 2){
        return 3;
    }else if (section == 3){
        return 1;
    }else{
        return 7;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        NormalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NormalCell" forIndexPath:indexPath];
        cell.nameLabel.text = [NSString stringWithFormat:@"钻石%ld",(long)indexPath.item];
        return cell;
        
    }else if (indexPath.section == 2){
        FristCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FristCell" forIndexPath:indexPath];
        CGFloat smallWidth = (kScreenW-30)/3;
        CGFloat bigWidth= 15+smallWidth*2;
        CGFloat originY = 160*KScreen_H_Scale+30;
        if(indexPath.item==0){
            cell.frame=CGRectMake(5, originY+60*KScreen_H_Scale , bigWidth, 200*KScreen_H_Scale+10);
            cell.goodsImage.frame = CGRectMake(0, 0, bigWidth, 200*KScreen_H_Scale+10);
            cell.nameLabel.frame = CGRectMake(0, 200*KScreen_H_Scale+10-40*KScreen_H_Scale, 100, 40*KScreen_H_Scale);
        }else if(indexPath.item==1){
            cell.frame=CGRectMake(bigWidth+10, originY+60*KScreen_H_Scale , smallWidth, 100*KScreen_H_Scale);
            cell.goodsImage.frame = CGRectMake(0, 0, smallWidth, 100*KScreen_H_Scale);
            cell.nameLabel.frame = CGRectMake(0, 100*KScreen_H_Scale-40*KScreen_H_Scale, 100, 40*KScreen_H_Scale);
        }else{
            NSInteger index = indexPath.item+3;
            cell.frame=CGRectMake(5+(smallWidth+10) *(index%3), originY +60*KScreen_H_Scale+(100*KScreen_H_Scale+10) *(index/3), smallWidth, 100*KScreen_H_Scale);
            cell.goodsImage.frame = CGRectMake(0, 0, smallWidth, 100*KScreen_H_Scale);
            cell.nameLabel.frame = CGRectMake(0, 100*KScreen_H_Scale-40*KScreen_H_Scale, 100, 40*KScreen_H_Scale);
        }
        
        cell.goodsImage.backgroundColor=[UIColor greenColor];
        cell.nameLabel.text= [NSString stringWithFormat:@"钻石%ld",(long)indexPath.item];
        return cell;
    }else if (indexPath.section == 3){
        SupermarketCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SupermarketCell" forIndexPath:indexPath];
        CGFloat originY = 360*KScreen_H_Scale+60+85*KScreen_H_Scale+60*KScreen_H_Scale;
        cell.frame=CGRectMake(0, originY , 5*(kScreenW-40)/4+50, 110*KScreen_H_Scale);
        cell.imageView.backgroundColor=[UIColor greenColor];
        cell.cellDelegate = self;
        [cell.scrollView setFrame:CGRectMake(0, cell.scrollView.frame.origin.y, kScreenW, 110*KScreen_H_Scale)];
        return cell;
    }else{
        SecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SecondCell" forIndexPath:indexPath];
        cell.goodsImage.backgroundColor=[UIColor greenColor];
        cell.priceLabel.text= @"￥60.50";
        cell.detailLabel.text= @"18K 黄金 珍珠吊坠 淡水珍珠项链";
        cell.backgroundColor=[UIColor grayColor];
        return cell;
    }
}
#pragma -HorizontalScrollCellDelegate
-(void)cellSelectedText:(NSString *)text
{
    NSLog(@"Selected text = %@!!",text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
