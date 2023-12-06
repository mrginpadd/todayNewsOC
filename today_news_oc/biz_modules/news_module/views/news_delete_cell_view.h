//
//  news_delete_cell_view.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDeleteCellView : UIView

- (void) showDeleteViewFromPoint: (CGPoint)point clickBlock:(dispatch_block_t) clickBlock;


- (void) dissmissDeleteView;

@end

NS_ASSUME_NONNULL_END
