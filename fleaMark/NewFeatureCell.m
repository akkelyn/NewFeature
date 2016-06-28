//
//  NewFeatureCell.m
//  fleaMark
//
//  Created by runone02 on 16/6/27.
//  Copyright © 2016年 runone02. All rights reserved.
//

#import "NewFeatureCell.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface NewFeatureCell ()
/**
 *  show the startImage
 */
@property(weak, nonatomic) UIImageView *imageView;
/**
 *  movieplayer for play
 */
@property(strong, nonatomic) MPMoviePlayerController *moviePlayer;

@end


@implementation NewFeatureCell

#pragma mark - lazy loading
- (MPMoviePlayerController *)moviePlayer
{
    if (!_moviePlayer) {
        MPMoviePlayerController *player = [[MPMoviePlayerController alloc] init];
        [player.view setFrame:self.contentView.bounds];
        
        player.shouldAutoplay  = NO;//默认不自动开始
        player.movieSourceType = MPMovieSourceTypeFile;//视频资源的类型
        player.controlStyle    = MPMovieControlStyleNone;//moviePlayerController的类型，取消下面的控制视图（暂停，上，下）
        [self.contentView addSubview:player.view];
        //notification for player‘s status
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerDisplayChange) name:MPMoviePlayerReadyForDisplayDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playFinished) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
        _moviePlayer = player;
    }
    return _moviePlayer;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.moviePlayer.view.bounds];
        [self.moviePlayer.view addSubview:imageV];
        _imageView = imageV;
    }
    return _imageView;
}

#pragma mark - private method
- (void)playerDisplayChange {
    if (self.moviePlayer.readyForDisplay) {//如果第一个视频准备好了就为YES
        [self.moviePlayer.backgroundView addSubview:self.imageView];
    }
}
- (void)playFinished {
    [[NSNotificationCenter defaultCenter] postNotificationName:PlayFinishedNotify object:nil];
}

#pragma mark - cancel notification
-(void)dealloc {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - get data
- (void)setStartImage:(UIImage *)startImage {

    _startImage = startImage;
    self.imageView.image = _startImage;
}

- (void)setMoviePath:(NSString *)moviePath {
    _moviePath = moviePath;
    [self.moviePlayer stop];
    self.moviePlayer.view.backgroundColor = [UIColor clearColor];
    self.moviePlayer.contentURL = [[NSURL alloc] initFileURLWithPath:moviePath];
    [self.moviePlayer prepareToPlay];
    [self.moviePlayer play];

}






















@end
