//
//  start_view_controller.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/3.
//

#import <Foundation/Foundation.h>
#import "star_view_controller.h"

@interface StarViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
-(void)buildViews;
- (void) normalClick;
@end

@implementation StarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildViews];
}

-(void)buildViews {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 5, self.view.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    
    
    NSArray *colorArray = @[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor], [UIColor blackColor]];
    
    for (int i=0; i<5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame: CGRectMake(i*scrollView.bounds.size.width, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            view.backgroundColor = colorArray[i];
            
            [view addSubview:({
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
                view.backgroundColor = [UIColor whiteColor];
                UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(normalClick)];
                tapGes.delegate = self;
                [view addGestureRecognizer:tapGes];
                view;
            })];
            view;
        })];
    }
    
    [self.view addSubview:scrollView];
}


- (void) normalClick{
    NSLog(@"normalClick");
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;;
}
#pragma scrollView代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll - %@  第%@页",  @(scrollView.contentOffset.x), @(floor(scrollView.contentOffset.x / scrollView.bounds.size.width)));
}
@end
