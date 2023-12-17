//
//  VideoPlayer.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface VideoPlayer : NSObject

+ (VideoPlayer *) sharedPlayer;
- (void)playWithUrl:(NSString *)videoUrl attachView: (UIView *) attachView;
@end

NS_ASSUME_NONNULL_END
