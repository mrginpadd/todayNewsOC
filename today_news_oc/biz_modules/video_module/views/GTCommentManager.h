//
//  GTCommentManager.h
//  today_news_oc
//
//  Created by xushihao on 2024/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTCommentManager : UIView

+(GTCommentManager*) shared;
- (void)showCommentView;

@end

NS_ASSUME_NONNULL_END
