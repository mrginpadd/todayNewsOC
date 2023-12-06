//
//  news_tableview_cell.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol NewsTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDelBtn:(UIButton *)delBtn;

@end

@interface NewsTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite) id<NewsTableViewCellDelegate> delegate;

- (void) layoutTableViewCell;

@end

NS_ASSUME_NONNULL_END
