//
//  NewFeatureController.h
//  fleaMark
//
//  Created by runone02 on 16/6/27.
//  Copyright © 2016年 runone02. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MS_Width [UIScreen mainScreen].bounds.size.width
#define MS_Height [UIScreen mainScreen].bounds.size.height
#define Key_Window [UIApplication sharedApplication].keyWindow

@interface NewFeatureController : UICollectionViewController
/**
 *  front cover images
 */
@property (nonatomic, strong) NSArray *guideImagesArr;
/**
 *  movie path array
 */
@property (nonatomic, strong) NSArray *guideMoviePathArr;
/**
 *  the last movie did finish
 */
@property (nonatomic, copy) void (^lastOnePlayFinished)();

@end
