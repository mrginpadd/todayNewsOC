//
//  CTMediator.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CTMediator : NSObject

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;
@end

NS_ASSUME_NONNULL_END
