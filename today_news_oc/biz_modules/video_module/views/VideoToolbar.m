//
//  VideoToolbar.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/17.
//

#import "VideoToolbar.h"
#import "UIImage+Custom.h"
@interface VideoToolbar()

@property(nonatomic, strong, readwrite) UIImageView *avatarImageView;
@property(nonatomic, strong, readwrite) UILabel *nickLabel;

@property(nonatomic, strong, readwrite) UIImageView *commentImageView;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;

@property(nonatomic, strong, readwrite) UIImageView *likeImageView;
@property(nonatomic, strong, readwrite) UILabel *likeLabel;

@property(nonatomic, strong, readwrite) UIImageView *shareImageView;
@property(nonatomic, strong, readwrite) UILabel *shareLabel;
@end


@implementation VideoToolbar

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:({
            _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _avatarImageView.layer.masksToBounds = YES;
            _avatarImageView.layer.cornerRadius = 15;
            _avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _avatarImageView;
        })];
        
        [self addSubview:({
            _nickLabel = [[UILabel alloc] init];
            _nickLabel.font = [UIFont systemFontOfSize:15];
            _nickLabel.textColor = [UIColor lightGrayColor];
            _nickLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _nickLabel;
        })];
        
        [self addSubview:({
            _commentImageView = [[UIImageView alloc] initWithFrame:frame];
            _commentImageView.layer.masksToBounds = YES;
            _commentImageView.layer.cornerRadius = 15;
            _commentImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _commentImageView;
        })];
        
        [self addSubview:({
            _commentLabel = [[UILabel alloc] init];
            _commentLabel.font = [UIFont systemFontOfSize:15];
            _commentLabel.textColor = [UIColor lightGrayColor];
            _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _commentLabel;
        })];
        [self addSubview:({
            _likeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _likeImageView.layer.masksToBounds = YES;
            _likeImageView.layer.cornerRadius = 15;
            _likeImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _likeImageView;
        })];
        [self addSubview:({
                    _likeLabel = [[UILabel alloc] init];
                    _likeLabel.font = [UIFont systemFontOfSize:15];
                    _likeLabel.textColor = [UIColor lightGrayColor];
                    _likeLabel.translatesAutoresizingMaskIntoConstraints = NO;
                    
        })];
        [self addSubview:({
                    _shareImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _shareImageView.layer.masksToBounds = YES;
            _shareImageView.layer.cornerRadius = 15;
            _shareImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _shareImageView.contentMode = UIViewContentModeScaleToFill;
            _shareImageView;
        })];
        
        [self addSubview:({
            _shareLabel = [[UILabel alloc] init];
            _shareLabel.font = [UIFont systemFontOfSize:15];
            _shareLabel.textColor = [UIColor lightGrayColor];
            _shareLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _shareLabel;
        })];
        
    }
    return self;

}

-(void)layoutWithModel:(id)model {
    self.backgroundColor = [UIColor redColor];
    _avatarImageView.image = [UIImage imageNamed:@"home_selected.png"].smallImage;
    _nickLabel.text = @"极客时间";
    
    _commentImageView.image = [UIImage imageNamed:@"home_selected.png"].smallImage;
    _commentLabel.text = @"100";
    
    _likeImageView.image = [UIImage imageNamed:@"home_selected.png"].smallImage;
    _likeLabel.text = @"25";
    
    _shareImageView.image = [UIImage imageNamed:@"home_selected.png"].smallImage;
    _shareLabel.text = @"100";
    
    [NSLayoutConstraint activateConstraints:@[
        //头像在左中
        //头像中心和父view中心Y 一致
        [NSLayoutConstraint constraintWithItem:_avatarImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:_avatarImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:15], //距离self左边的距离时15
        
        //设置宽度，无需参考其他视图
        [NSLayoutConstraint constraintWithItem:_avatarImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
        [NSLayoutConstraint constraintWithItem:_avatarImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
        
        //昵称约束
        [NSLayoutConstraint constraintWithItem:_nickLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_avatarImageView attribute:NSLayoutAttributeCenterY multiplier:1 constant:5],
        
        [NSLayoutConstraint constraintWithItem:_nickLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_avatarImageView attribute:NSLayoutAttributeRight multiplier:1 constant:5],
        
        [NSLayoutConstraint constraintWithItem:_nickLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_avatarImageView attribute:NSLayoutAttributeHeight multiplier:1 constant:0], //距离self左边的距离时15
        

     
    ]];
}

@end
