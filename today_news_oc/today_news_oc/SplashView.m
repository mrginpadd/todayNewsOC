//
//  SplashView.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/19.
//

#import "SplashView.h"
#import "ScreenUtil.h"
#import "UIImage+Custom.h"
@interface SplashView()

@property(nonatomic, strong, readwrite) UIButton *button;
@property(nonatomic, assign, readwrite) int time;
@end

@implementation SplashView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    _time = 3;
    
    if (self) {
        NSTimer *timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(delTime) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:CGRectMake(280, STATUSBARHEIGHT + NAVIGATIONBARHEIGHT, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            

            
            [_button setTitle:[NSString stringWithFormat:@"跳过(%d秒)", _time] forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            [_button sizeToFit];
            
            _button;
        })];
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleToFill;
        
        self.image = [UIImage imageNamed:@"LaunchImage.png"];
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (void) removeSplashView {
    [self removeFromSuperview];
}

- (void) delTime {
    _time--;
    if (_time == 0) {
        [self removeSplashView];
    }
    
    [_button setTitle:[NSString stringWithFormat:@"跳过(%d秒)", _time] forState:UIControlStateNormal];

}
@end
