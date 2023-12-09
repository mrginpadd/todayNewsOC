//
//  NewsListLoader.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/8.
//

#import <Foundation/Foundation.h>

@class NewsModel;  //采用class声明，就可以避免引入其他头文件
//#import "NewsModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef  void(^NewsListLoaderFinishBlock)(BOOL success, NSArray<NewsModel*> *dataArray);
@interface NewsListLoader : NSObject

- (void)loadListDataWithFinishBlock:(NewsListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
