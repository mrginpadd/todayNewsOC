//
//  GTLocation.h
//  today_news_oc
//
//  Created by xushihao on 2024/1/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTLocation : NSObject
+(GTLocation  *)shared;
-(void) checkLocationAuthorization;
@end

NS_ASSUME_NONNULL_END
