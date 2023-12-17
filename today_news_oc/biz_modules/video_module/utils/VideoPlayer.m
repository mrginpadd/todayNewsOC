//
//  VideoPlayer.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/17.
//

#import "VideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoPlayer()

@property(nonatomic, strong, readwrite) NSString* videoUrl;
@property(nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property(nonatomic, strong, readwrite) AVPlayer *avPlayer;
@property(nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;
@end

@implementation VideoPlayer

+ (VideoPlayer *) sharedPlayer {
    static VideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[VideoPlayer alloc] init];
    });
    return player;
}
- (void)playWithUrl:(NSString *)videoUrl attachView: (UIView *) attachView {
    if ([videoUrl isEqualToString:_videoUrl] && _avPlayer.timeControlStatus == AVPlayerTimeControlStatusPlaying) { //暂停播放
        [_avPlayer pause];
        return;
    } else if([videoUrl isEqualToString:_videoUrl] && _avPlayer.timeControlStatus == AVPlayerTimeControlStatusPaused) { // 继续播放
        [self continuePlay];
        return;
    } else {
        [self _stopPlay]; //将之前的销毁掉, 播放新视频
    }

    
    NSLog(@"点击播放");
    
    _videoUrl = videoUrl;
    
    NSURL *videoURL = [NSURL URLWithString:videoUrl];
    
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    CMTime duration = _videoItem.duration;
    CGFloat videoDuration = CMTimeGetSeconds(duration);
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    
    [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
            NSLog(@"播放进度 %@", @(CMTimeGetSeconds(time)));
    }];
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    
    _playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:_playerLayer];
    
    //播放完毕通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
}

-(void) continuePlay {
    CMTime currentTime = _avPlayer.currentTime;
    [_avPlayer play];
    [_avPlayer seekToTime:currentTime]; // 将播放进度定位到之前的位置
}

-(void) _stopPlay {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_playerLayer removeFromSuperlayer];
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    _videoItem = nil;
    _avPlayer = nil;
    _videoUrl = nil;
}

- (void)_handlePlayEnd {

    //重新播放
    [_avPlayer seekToTime: CMTimeMake(0, 1)];
    [_avPlayer play];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            [_avPlayer play];
        } else {
            NSLog(@"sda");
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSLog(@"缓冲 %@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}

@end
