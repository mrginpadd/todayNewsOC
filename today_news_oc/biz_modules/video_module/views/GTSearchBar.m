//
//  GTSearchBar.m
//  today_news_oc
//
//  Created by xushihao on 2024/1/13.
//

#import "GTSearchBar.h"
#import "ScreenUtil.h"
#import "ImageUtil.h"
@interface GTSearchBar()<UITextFieldDelegate>

@property(nonatomic, strong, readwrite) UITextField *textField;

@end
@implementation GTSearchBar

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _textField = [[UITextField alloc] initWithFrame:CGRectMake(UI(10), UI(5), self.frame.size.width - UI(10)*2, self.frame.size.height - UI(5)*2)];
            _textField.backgroundColor = [UIColor whiteColor];
            _textField.leftView = [[UIImageView alloc] initWithImage:[ImageUtil getFitImage:[UIImage imageNamed:@"play"]]];
            //搜索图标
            _textField.leftViewMode = UITextFieldViewModeAlways;
            //清楚按钮
            _textField.clearButtonMode = UITextFieldViewModeAlways;
            _textField.placeholder = @"请输入关键词";
            _textField.delegate = self;
            
            _textField;
        })];
    }
    return self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    [_textField becomeFirstResponder];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason API_AVAILABLE(ios(10.0)) {
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}

- (void)textFieldDidChangeSelection:(UITextField *)textField API_AVAILABLE(ios(13.0), tvos(13.0)) {
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_textField resignFirstResponder]; //收起键盘
    return YES;
}
@end
