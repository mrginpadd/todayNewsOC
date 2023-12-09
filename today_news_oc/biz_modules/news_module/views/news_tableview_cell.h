//
//  news_tableview_cell.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class NewsModel;

@protocol NewsTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDelBtn:(UIButton *)delBtn;

@end

@interface NewsTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite) id<NewsTableViewCellDelegate> delegate;

- (void) layoutTableViewCellWithModel:(NewsModel *)model;

@end

NS_ASSUME_NONNULL_END
