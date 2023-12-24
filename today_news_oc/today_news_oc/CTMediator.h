//
//  CTMediator.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol NewsDetailViewControllerProtocol <NSObject>
- (__kindof UIViewController *)initWithUrl:(NSString *)detailUrl;
@end


@interface CTMediator : NSObject

//target action解耦
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

//urlscheme 解耦
typedef void(^CTMediatorProcessBlock)(NSDictionary *params);

+ (NSMutableDictionary *)mediatorCache;
+ (void)registerScheme:(NSString *)scheme processBlock:(CTMediatorProcessBlock) processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

//protocol class解耦方案
+ (void)registerProtocol:(Protocol *)protocol class:(Class)clas;
+ (Class)classForProtocol:(Protocol *)protocol;

@end

NS_ASSUME_NONNULL_END
