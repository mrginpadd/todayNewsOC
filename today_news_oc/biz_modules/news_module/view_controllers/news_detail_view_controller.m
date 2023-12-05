//
//  news_detail_view_controllerViewController.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/5.
//

#import "news_detail_view_controller.h"
#import <WebKit/WebKit.h>
@interface NewsDetailViewController ()<WKNavigationDelegate>

@property(nonatomic, strong, readwrite) WKWebView *webView;
@property(nonatomic, strong, readwrite) UIProgressView *progressView; //加载进度条
@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildViews];
}

- (void)buildViews {
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height - 80)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, 20)];
        
        self.progressView;
    })];
    
    [self layoutViews];

}

- (void)layoutViews {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://time.geekbang.org/resource?pt=4&utm_campaign=geektime_search&utm_content=geektime_search&utm_medium=geektime_search&utm_source=geektime_search&utm_term=geektime_search"]]];
   
    // 监听self.webView 的estimatedProgress变化
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)dealloc {
    // 移除监听
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

#pragma WKWebView代理方法
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"decidePolicyForNavigationAction");
    decisionHandler(WKNavigationActionPolicyAllow);
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"didFinishNavigation");
}

// 属性监听的回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@", change[@"new"]);
    self.progressView.progress = self.webView.estimatedProgress;
    if (self.progressView.progress == 1) {
        [self.progressView removeFromSuperview];
    }
}

@end