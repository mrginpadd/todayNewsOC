//
//  CTMediator.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/24.
//

#import "CTMediator.h"

@implementation CTMediator

//target action 解耦方案
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl {
    Class detailCls = NSClassFromString(@"NewsDetailViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:(@"initWithUrl")];
    return controller;
}

// url scheme 解耦方案
+ (NSMutableDictionary *)mediatorCache {
    static NSMutableDictionary *cache;
    static dispatch_once_t *onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}


+ (void)registerScheme:(NSString *)scheme processBlock:(CTMediatorProcessBlock) processBlock {
    
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme]; 
    }
    
}
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params {
    CTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if(block) {
        block(params);
    }
}

//protocol class解耦方案
+ (void)registerProtocol:(Protocol *)protocol class:(Class)clas {
    if (protocol && clas) {
        [[[self class] mediatorCache] setObject:clas forKey:NSStringFromProtocol(protocol)];
        
    }
}
+ (Class)classForProtocol:(Protocol *)protocol {
    return [[[self class] mediatorCache]  objectForKey:NSStringFromProtocol(protocol)];
}
@end
