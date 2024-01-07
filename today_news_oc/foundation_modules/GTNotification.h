//
//  GTNotification.h
//  today_news_oc
//
//  Created by xushihao on 2024/1/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTNotification : NSObject
+(GTNotification *) shared;
-(void) checkNotificationAuthorization;
@end

NS_ASSUME_NONNULL_END
