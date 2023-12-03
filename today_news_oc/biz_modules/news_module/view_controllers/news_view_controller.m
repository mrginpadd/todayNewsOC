//
//  news_view_controller.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/3.
//

#import "news_view_controller.h"

@interface NewsViewController ()<UITableViewDataSource>
- (void)buildViews;
- (void)gotoOtherPage;
@end

@implementation NewsViewController

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
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
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
    return 40;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId"];
    }
    cell.imageView.image = [UIImage imageNamed:@"star_unselected.png"];
    cell.textLabel.text = @"主标题";
    cell.detailTextLabel.text = [NSString stringWithFormat:@"单元格 %d", indexPath.row];
    return cell;
}
@end
