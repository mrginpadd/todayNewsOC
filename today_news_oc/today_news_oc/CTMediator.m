//
//  CTMediator.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/24.
//

#import "CTMediator.h"

@implementation CTMediator

//target action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl {
    Class detailCls = NSClassFromString(@"NewsDetailViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:(@"initWithUrlString")];
    return controller;
}
@end
