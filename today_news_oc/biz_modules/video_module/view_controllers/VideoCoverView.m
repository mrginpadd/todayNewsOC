//
//  VideoCoverView.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/11.
//

#import "VideoCoverView.h"
#import "VideoPlayer.h"
#import "VideoToolbar.h"
@interface VideoCoverView()

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, strong, readwrite) NSString *videoCoverUrl;
@property(nonatomic, strong, readwrite) NSString *videoUrl;
@property(nonatomic, strong, readwrite) VideoToolbar *toolBar;


@end

@implementation VideoCoverView


-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - VideoToolbarHeight)];
            _coverView;
        })];
        
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50) / 2, (frame.size.height - 50 - VideoToolbarHeight) / 2, 50, 50)];
            _playButton.image = [UIImage imageNamed:@"play.png"];
            _playButton;
        })];
        
        [self addSubview:({
            _toolBar = [[VideoToolbar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width , VideoToolbarHeight )];
            _toolBar;
        })];
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(play)];
        
        [self addGestureRecognizer:tapGes];
        

    }
    return self;
}

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl: (NSString *) videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
    [_toolBar layoutWithModel:nil];
}

-(void)play {
    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    [[VideoPlayer sharedPlayer] playWithUrl:_videoUrl attachView:_coverView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)_handlePlayEnd {

}

- (void) dealloc {
  
}
@end
