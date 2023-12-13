//
//  VideoCoverView.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/11.
//

#import "VideoCoverView.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoCoverView()

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, strong, readwrite) NSString *videoCoverUrl;
@property(nonatomic, strong, readwrite) NSString *videoUrl;

@property(nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property(nonatomic, strong, readwrite) AVPlayer *avPlayer;
@property(nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;


@end

@implementation VideoCoverView


-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _coverView;
        })];
        
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50) / 2, (frame.size.height - 50) / 2, 50, 50)];
            _playButton.image = [UIImage imageNamed:@"play.png"];
            _playButton;
        })];
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(play)];
        
        [self addGestureRecognizer:tapGes];
    }
    return self;
}

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl: (NSString *) videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
}

-(void)play {
    NSLog(@"点击播放");
    
    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    
    _playerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:_playerLayer];
    

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            [_avPlayer play];
        } else {
            NSLog(@"sda");
        }
    }
}

- (void) dealloc {
    [_videoItem removeObserver:self forKeyPath:@"status"];
}
@end
