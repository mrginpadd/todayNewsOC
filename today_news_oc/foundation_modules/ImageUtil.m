//
//  ImageUtil.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/2.
//


#import "ImageUtil.h"

@implementation ImageUtil : NSObject

+ (UIImage*)getFitImage:(UIImage *)originalImage {
    // 根据需要调整图片大小
    CGSize targetSize = CGSizeMake(30, 30); // 设置目标尺寸
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    [originalImage drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


@end
