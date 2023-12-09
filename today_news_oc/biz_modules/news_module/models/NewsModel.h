//
//  NewsModel.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//
//"result": {
//    "stat": "1",
//    "data": [
//        {
//            "uniquekey": "db61b977d9fabd0429c6d0c671aeb30e",
//            "title": "“新时代女性的自我关爱”主题沙龙暨双山街道福泰社区妇儿活动家园启动仪式举行",
//            "date": "2021-03-08 13:47:00",
//            "category": "头条",
//            "author_name": "鲁网",
//            "url": "https://mini.eastday.com/mobile/210308134708834241845.html",
//            "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20210308/20210308134708_d0216565f1d6fe1abdfa03efb4f3e23c_0_mwpm_03201609.png",
//            "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20210308/20210308134708_d0216565f1d6fe1abdfa03efb4f3e23c_1_mwpm_03201609.png",
//            "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20210308/20210308134708_d0216565f1d6fe1abdfa03efb4f3e23c_2_mwpm_03201609.png",
//            "is_content": "1"
            
@interface NewsModel : NSObject
@property(nonatomic, strong, readwrite) NSString *uniquekey;
@property(nonatomic, strong, readwrite) NSString *title;
@property(nonatomic, strong, readwrite) NSString *date;
@property(nonatomic, strong, readwrite) NSString *category;
@property(nonatomic, strong, readwrite) NSString *author_name;

@property(nonatomic, strong, readwrite) NSString *url;
@property(nonatomic, strong, readwrite) NSString *thumbnail_pic_s;
@property(nonatomic, strong, readwrite) NSString *thumbnail_pic_s02;
@property(nonatomic, strong, readwrite) NSString *thumbnail_pic_s03;
@property(nonatomic, strong, readwrite) NSString *is_content;

+ (NewsModel*) initWithData: (NSDictionary*) dic;
- (NewsModel*) initWithData: (NSDictionary*) dic;
@end

NS_ASSUME_NONNULL_END
