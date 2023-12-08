//
//  NewsListLoader.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/8.
//

#import "NewsListLoader.h"

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
        NSLog(@"%@", response);
    }];
    
    [dataTask resume];
    
}

@end
