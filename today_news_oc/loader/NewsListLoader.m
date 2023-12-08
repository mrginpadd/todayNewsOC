//
//  NewsListLoader.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/8.
//

#import "NewsListLoader.h"
#import <AFNetworking/AFNetworking.h>
@interface NewsListLoader()
@property(nonatomic, strong, readonly) NSString *apiKey;
@end
@implementation NewsListLoader

- (void)loadListData {
    NSLog(@"loadListData");
    
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=78e827441812527922718592f358d7bf";
    
    NSURL *listUrl = [NSURL URLWithString:urlString];

    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:listUrl];

    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError = nil;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
//        NSLog(@"%@", response);
    }];

    [dataTask resume];
    
    
    // AFNetworking自动帮我们解析了结果，而上面的是二进制流
//    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"");
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"");
//        }];
    
}

@end
