//
//  GTCommentManager.m
//  today_news_oc
//
//  Created by xushihao on 2024/1/14.
//

#import "GTCommentManager.h"
#import <UIKit/UIKit.h>
#import "ScreenUtil.h"
@interface GTCommentManager()<UITextViewDelegate>

@property(nonatomic, strong, readwrite) UITextView *textView;
@property(nonatomic, strong, readwrite) UIView *backgrounView;
@end
@implementation GTCommentManager

+(GTCommentManager*) shared {
    static dispatch_once_t once_token;
    static GTCommentManager *manager;
    dispatch_once(&once_token, ^{
        manager = [[GTCommentManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _backgrounView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _backgrounView.backgroundColor = [UIColor colorWithRed:0 green:220 blue:23 alpha:0.5];
        [_backgrounView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(_tapBackground)]];
        
        [_backgrounView addSubview:({
                    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, _backgrounView.bounds.size.height - UI(100), SCREEN_WIDTH, UI(100))];
            _textView.backgroundColor = [UIColor whiteColor];
            _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
            _textView.layer.borderWidth = 5.f;
            _textView.userInteractionEnabled = YES;
            _textView.delegate = self;
            _textView;
        })];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_doTextViewAnimationWithNotification) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
    return self;
}

- (void)_tapBackground {
    [_textView resignFirstResponder]; //收起键盘
    [_backgrounView removeFromSuperview];
}

- (void)showCommentView {
    [[UIApplication sharedApplication].keyWindow addSubview:_backgrounView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.textView && [self.textView canBecomeFirstResponder]) {
            [self.textView becomeFirstResponder];
        }
    });
    
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    return YES;
}

-(void)_doTextViewAnimationWithNotification: (NSNotification *)noti {
    CGFloat duration = [[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyboardFrame = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if (keyboardFrame.origin.y >= SCREEN_HEIGHT) {
        //键盘收起
        [UIView animateWithDuration:duration animations:^{
            self.textView.frame = CGRectMake(0, self.backgrounView.bounds.size.height, SCREEN_WIDTH, UI(100));
        }];
    } else {
        //键盘探出
        [UIView animateWithDuration:duration animations:^{
            self.textView.frame = CGRectMake(0, self.backgrounView.bounds.size.height - keyboardFrame.size.height - UI(100), SCREEN_WIDTH, UI(100));
        }];
        
    }}
    - (void)dealloc {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
@end
