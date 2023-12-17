//
//  UIImage+Custom.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/17.
//

#import "UIImage+Custom.h"
#define smallSize CGSizeMake(16, 16)
#define middleSize CGSizeMake(32, 32)
#define largeSize CGSizeMake(48, 48)
@implementation UIImage(Custom)

- (UIImage *)smallImage{
    return [self getFitSizeImage:smallSize];
}

- (UIImage *)middleImage{
    return [self getFitSizeImage:middleSize];
}

- (UIImage *)largeImage{
    return [self getFitSizeImage:largeSize];
}

- (UIImage *)getFitSizeImage:(CGSize) size {
    // 根据需要调整图片大小
    CGSize targetSize = size;// 设置目标尺寸
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
