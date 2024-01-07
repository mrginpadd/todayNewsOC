//
//  GTNotification.m
//  today_news_oc
//
//  Created by xushihao on 2024/1/7.
//

#import "GTNotification.h"
#import <UserNotifications/UserNotifications.h>

@interface GTNotification()<UNUserNotificationCenterDelegate>

@end
@implementation GTNotification
+(GTNotification *) shared {
    static GTNotification* notification;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        notification = [[GTNotification alloc] init];
    });
    return notification;
}

-(void) checkNotificationAuthorization {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) { //请求权限成功后触发推送
            [self _pushLocalNotification];
        }
        
    }];
}

-(void)_pushLocalNotification {
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"我是本地通知";
    content.badge = @(1);
    content.body = @"哈哈哈，我发了通知";
    content.sound = [UNNotificationSound defaultSound];
    //时间间隔类型的通知
    //15s后触发通知
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5.f repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"_pushLocalNotification" content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            
    }];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler API_AVAILABLE(macos(10.14), ios(10.0), watchos(3.0), tvos(10.0)) {
    //顶部弹窗的形式展示x
//    completionHandler(UNNotificationPresentationOptionAlert);
//    completionHandler(UNNotificationPresentationOptionSound);
    completionHandler(UNNotificationPresentationOptionBanner);
}

// The method will be called on the delegate when the user responded to the notification by opening the application, dismissing the notification or choosing a UNNotificationAction. The delegate must be set before the application returns from application:didFinishLaunchingWithOptions:.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler API_AVAILABLE(macos(10.14), ios(10.0), watchos(3.0)) API_UNAVAILABLE(tvos) {
    completionHandler();
}
@end
