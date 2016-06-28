//
//  NewFeatureController.m
//  fleaMark
//
//  Created by runone02 on 16/6/27.
//  Copyright © 2016年 runone02. All rights reserved.
//

#import "NewFeatureController.h"
#import "NewFeatureCell.h"
#import "NewFeatureLayout.h"
#import "ViewController.h"

@interface NewFeatureController ()
/**
 *  pageControl
 */
@property (nonatomic, strong) UIPageControl *pageControl;
/**
 *  identifier for movie did finish
 */
@property (nonatomic, assign, getter=isMovieFinished) BOOL movieFinished;
@end

@implementation NewFeatureController

static NSString * const reuseIdentifier = @"NewFeatureCell";

#pragma mark - lazy loading
- (UIPageControl *)pageControl {
    CGFloat width = 120;
    CGFloat height = 30;
    CGFloat x = (MS_Width - width) * 0.5;
    CGFloat y = MS_Height - 30 - 20;
    if (!_pageControl) {
        UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(x, y, width, height)];
        pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl =pageControl;
        [Key_Window addSubview:_pageControl];
    }
    return _pageControl;
}
#pragma mark - init layout
- (instancetype)init {
    return [super initWithCollectionViewLayout:[[NewFeatureLayout alloc]init]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.pageControl.numberOfPages = self.guideImagesArr.count;
}
- (void)config
{
    [self.collectionView registerClass:[NewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieFinished) name:PlayFinishedNotify object:nil];
}
- (void)movieFinished
{
    self.movieFinished = YES;
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.guideImagesArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.startImage = [UIImage imageNamed:self.guideImagesArr[indexPath.row]];
    cell.moviePath = self.guideMoviePathArr[indexPath.row];
    
    self.movieFinished = NO;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.guideImagesArr.count - 1 && self.isMovieFinished) {
        if (self.lastOnePlayFinished) {
            self.lastOnePlayFinished();
        }
    }
}
#pragma mark <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    uint page = (scrollView.contentOffset.x / scrollView.bounds.size.width) + 0.5;
    self.pageControl.currentPage = page;
}
@end
