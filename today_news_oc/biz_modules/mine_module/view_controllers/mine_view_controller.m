//
//  mine_view_controller.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/2.
//

#import "mine_view_controller.h"
#import "GTLogin.h"
@interface MineViewController ()<UITableViewDataSource, UITableViewDelegate>
- (void)buildViews;
- (void)gotoOtherPage;

@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) UITableViewHeaderFooterView *tableViewHeaderView;
@property (nonatomic, strong, readwrite) UIImageView *headerImageView;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self buildViews];
    
}


- (void)buildViews {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)doSth {
}

- (void)gotoOtherPage {
    NSLog(@"跳转其他页面");
    UIViewController *tempViewController = [[UIViewController alloc] init];
    tempViewController.title = @"新页面";
    tempViewController.view.backgroundColor = [UIColor blueColor];
    tempViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(doSth)];
    [self.navigationController pushViewController:tempViewController animated:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!_tableViewHeaderView) {
        _tableViewHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
        _tableView.backgroundColor = [UIColor whiteColor];
        
        [_tableViewHeaderView addSubview:({
            _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 90)];
            _headerImageView.backgroundColor = [UIColor whiteColor];
            _headerImageView.contentMode = UIViewContentModeScaleAspectFit;
            _headerImageView.clipsToBounds = YES;
            _headerImageView.userInteractionEnabled = YES;
            _headerImageView;
        })];
        
        [_tableViewHeaderView addGestureRecognizer:({
            UITapGestureRecognizer *tagGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage)];
            tagGes;
        })];
        
    }
    return _tableViewHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  200;
}



- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
//    if (![[GTLogin sharedLogin] isLogin]) {
//        //        _headerImageView setImage:【
//    } else {
//        
//    }
}

-(void) _tapImage {
    
}

@end
