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

//target action解耦
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

//urlscheme 解耦
typedef void(^CTMediatorProcessBlock)(NSDictionary *params);

+ (NSMutableDictionary *)mediatorCache;
+ (void)registerScheme:(NSString *)scheme processBlock:(CTMediatorProcessBlock) processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
