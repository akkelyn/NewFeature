//
//  NewFeatureCell.h
//  fleaMark
//
//  Created by runone02 on 16/6/27.
//  Copyright © 2016年 runone02. All rights reserved.
//  展示的cell

#import <UIKit/UIKit.h>

#define PlayFinishedNotify @"PlayFinishedNotify" 

@interface NewFeatureCell : UICollectionViewCell
/**
 *  a image when start movie
 */
@property (strong, nonatomic) UIImage *_Nonnull startImage;
/**
 *  movie path
 */
@property (copy, nonatomic) NSString *_Nonnull moviePath;

@end
