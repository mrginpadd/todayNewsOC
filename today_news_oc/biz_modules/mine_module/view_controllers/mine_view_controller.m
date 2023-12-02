//
//  mine_view_controller.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/2.
//

#import "mine_view_controller.h"

@interface MineViewController ()
- (void)buildViews;
- (void)gotoOtherPage;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self buildViews];
    
}


- (void)buildViews {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview: btn];
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoOtherPage)];
    [btn addGestureRecognizer:tapGes];
}

- (void)doSth {
}

- (void)gotoOtherPage {
    NSLog(@"跳转其他页面");
    UIViewController *tempViewController = [[UIViewController alloc] init];
    tempViewController.title = @"新页面";
    
    tempViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(doSth)];
    [self.navigationController pushViewController:tempViewController animated:YES];
}


@end
