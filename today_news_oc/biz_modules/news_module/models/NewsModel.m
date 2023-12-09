//
//  NewsModel.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/9.
//

#import "NewsModel.h"

@implementation NewsModel
- (NewsModel*) initWithData: (NSDictionary*) dic {
    self = [super init];
    if (self) {
        self.uniquekey = [dic objectForKey:@"uniquekey"];
        self.title = [dic objectForKey:@"title"];
        self.date = [dic objectForKey:@"date"];
        self.category = [dic objectForKey:@"category"];
        self.author_name = [dic objectForKey:@"author_name"];
        self.url = [dic objectForKey:@"url"];
        self.thumbnail_pic_s = [dic objectForKey:@"thumbnail_pic_s"];
        self.thumbnail_pic_s02 = [dic objectForKey:@"thumbnail_pic_s02"];
        self.thumbnail_pic_s03 = [dic objectForKey:@"thumbnail_pic_s03"];
        self.is_content = [dic objectForKey:@"is_content"];
    }
    return self;
}
+ (NewsModel*) initWithData: (NSDictionary*) dic{
    return [[[self alloc] init] initWithData:dic];
}

@end
