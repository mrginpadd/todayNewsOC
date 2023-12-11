//
//  VideoCoverView.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoCoverView : UICollectionViewCell

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl: (NSString *) videoUrl;
@end

NS_ASSUME_NONNULL_END
