//
//  UIImage+Custom.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage(Custom)
@property(nonatomic, strong, readonly) UIImage* smallImage;
@property(nonatomic, strong, readonly) UIImage* middleImage;
@property(nonatomic, strong, readonly) UIImage* largeImage;
+ (UIImage *)getFitSizeImage:(UIImage *)image size:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
