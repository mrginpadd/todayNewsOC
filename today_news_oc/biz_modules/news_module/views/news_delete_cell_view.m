//
//  news_delete_cell_view.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/6.
//

#import "news_delete_cell_view.h"

@interface NewsDeleteCellView()

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, strong, readwrite) dispatch_block_t deleteBlock;
- (void) buttonClick:(UIButton *) sender;
@end

@implementation NewsDeleteCellView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame: self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.6;
            
            UIGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissDeleteView)];
            [_backgroundView addGestureRecognizer:tapGes];
            _backgroundView;
        })];
        
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 200, 200)];
            [_deleteButton addTarget:self action:@selector(_buttonClick) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }
    return self;
}


- (void) _buttonClick {
    if (_deleteBlock) {
        _deleteBlock();
    }
    [self removeFromSuperview];
}

- (void) showDeleteViewFromPoint: (CGPoint)point clickBlock:(dispatch_block_t) clickBlock {
    
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    _deleteBlock = [clickBlock copy];
    
    UIWindowScene *windowScene = (UIWindowScene *)[UIApplication sharedApplication].connectedScenes.allObjects.firstObject;
    UIWindow *window = windowScene.windows.firstObject;
    [window addSubview:self];
    
    // 简单的弹出动画
//    [UIView animateWithDuration:1.f animations:^{
//        self.deleteButton.frame = CGRectMake(self.bounds.size.width / 2 - 100, self.bounds.size.height / 2 - 100, 200, 200);
//    }];
    
    // 复杂点的弹出动画
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake(self.bounds.size.width / 2 - 100, self.bounds.size.height / 2 - 100, 200, 200);
    } completion:^(BOOL finished) {
        self.deleteButton.frame = CGRectMake(self.bounds.size.width / 2 - 100, self.bounds.size.height / 2 - 100, 200, 200);
    }];
}


- (void) dissmissDeleteView {
    [self removeFromSuperview];
}

@end
