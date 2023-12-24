//
//  news_detail_view_controller.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/5.
//

#import <UIKit/UIKit.h>
#import "CTMediator.h"
@interface NewsDetailViewController : UIViewController<NewsDetailViewControllerProtocol>

-(NewsDetailViewController*) initWithUrl: (NSString *) url;
@end
