//
//  NewsListLoader.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/8.
//

#import "NewsListLoader.h"
#import <AFNetworking/AFNetworking.h>
#import "NewsModel.h"
@interface NewsListLoader()
@property(nonatomic, strong, readonly) NSString *apiKey;
@end
@implementation NewsListLoader

- (void)loadListDataWithFinishBlock:(NewsListLoaderFinishBlock)finishBlock {
    NSLog(@"loadListData");
    
    //先展示本地存储的的，再去请求接口替换数据
    NSArray<NewsModel*> *listData = [self _readDataFromLocal];
    if (listData != nil) {
        if (finishBlock) {
            dispatch_async(dispatch_get_main_queue(), ^{
                finishBlock(YES, listData);
            });
        }
    }
    
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=78e827441812527922718592f358d7bf";
    
    NSURL *listUrl = [NSURL URLWithString:urlString];

    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:listUrl];

    NSURLSession *session = [NSURLSession sharedSession];

    
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        NSError *jsonError = nil;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
//        NSLog(@"%@", response);
        
        NSArray *dataArray = [(NSDictionary*)[(NSDictionary *)jsonObj objectForKey:@"result"] objectForKey:@"data"];
        NSMutableArray *items = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            NewsModel *itemModel = [NewsModel initWithData:info];
            [items addObject:itemModel];
        }
        [strongSelf _archiveListDataWithArray: items.copy];
        //要在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock) {
                finishBlock(YES, items);
            }
        });

    }];

    [dataTask resume];

    
    
    // AFNetworking自动帮我们解析了结果，而上面的是二进制流
//    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"");
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"");
//        }];
    
}

- (NSArray<NewsModel*> *) _readDataFromLocal {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    
    //文件夹路径
    NSString *filePath = [cachePath stringByAppendingString:@"newFilePath"];
    NSError *fileError = nil;

    //文件路径
    NSString *listFilePath = [filePath stringByAppendingPathComponent:@"list"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //读取序列化的文件，并反序列化
    NSData *readListData = [fileManager contentsAtPath:listFilePath];
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [NewsModel class], nil] fromData:readListData error:nil];
    
    if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
        return (NSArray<NewsModel*>*)unarchiveObj;
    } else {
        return nil;
    }
 
}

- (void)_archiveListDataWithArray:(NSArray<NewsModel*> *)array {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *filePath = [cachePath stringByAppendingString:@"newFilePath"];
    NSError *fileError = nil;
    //创建文件夹
    [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:&fileError];
   
    //文件数据
//    NSData *fileContent = [@"写入文件的内容" dataUsingEncoding:NSUTF8StringEncoding];
    //将列表序列化后写入文件
    NSData *fileContent = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    //创建文件
    NSString *listFilePath = [filePath stringByAppendingPathComponent:@"list"];
    
    [fileManager createFileAtPath:listFilePath contents:fileContent attributes:nil];
    
    
    //读取序列化的文件，并反序列化
//    NSData *readListData = [fileManager contentsAtPath:listFilePath];
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [NewsModel class], nil] fromData:readListData error:nil];
    

    //查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listFilePath];
    
    //删除文件
//    if (fileExist) {
//        [fileManager removeItemAtPath:listFilePath error:nil];
//    }
    NSLog(@"");
    
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listFilePath];
//
//    //在文件末尾进行操作
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    //立即写入磁盘
//    [fileHandler synchronizeFile];
//
//    [fileHandler closeFile];
}

   



@end
