//
//  NewFeatureLayout.m
//  fleaMark
//
//  Created by runone02 on 16/6/27.
//  Copyright © 2016年 runone02. All rights reserved.
//

#import "NewFeatureLayout.h"

@implementation NewFeatureLayout
/**
 *  override prepareLayout
 */
-(void)prepareLayout {
    //config layout
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing =  0;
    self.minimumInteritemSpacing = 0;
    self.itemSize = self.collectionView.bounds.size;
    //config collectionview
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = NO;
}




@end
