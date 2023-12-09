//
//  NewsModel.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/9.
//

#import "NewsModel.h"

@implementation NewsModel

//反序列化
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.uniquekey =  [coder decodeObjectForKey:@"uniquekey"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.date = [coder decodeObjectForKey:@"date"];
        self.category = [coder decodeObjectForKey:@"category"];
        self.author_name = [coder decodeObjectForKey:@"author_name"];
        
        self.url = [coder decodeObjectForKey:@"url"];
        
        self.thumbnail_pic_s = [coder decodeObjectForKey:@"thumbnail_pic_s"];
        self.thumbnail_pic_s02 = [coder decodeObjectForKey:@"thumbnail_pic_s02"];
        self.thumbnail_pic_s03 = [coder decodeObjectForKey:@"thumbnail_pic_s03"];
        self.is_content = [coder decodeObjectForKey:@"is_content"];
    }
    return self;
    
}

//序列化
- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.author_name forKey:@"author_name"];
    
    [coder encodeObject:self.url forKey:@"url"];
    
    [coder encodeObject:self.thumbnail_pic_s forKey:@"thumbnail_pic_s"];
    [coder encodeObject:self.thumbnail_pic_s02 forKey:@"thumbnail_pic_s02"];
    [coder encodeObject:self.thumbnail_pic_s03 forKey:@"thumbnail_pic_s03"];
    [coder encodeObject:self.is_content forKey:@"is_content"];
    
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
