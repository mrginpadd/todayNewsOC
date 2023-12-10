//
//  news_view_controller.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/3.
//

#import "news_view_controller.h"
#import "news_tableview_cell.h"
#import "news_detail_view_controller.h"
#import "news_delete_cell_view.h"
#import "NewsListLoader.h"
#import "NewsModel.h"
@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource, NewsTableViewCellDelegate>

@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray *dataArray;
@property(nonatomic, strong, readwrite) NewsListLoader *listLoader;

- (void)buildViews;
- (void)gotoOtherPage;
@end

@implementation NewsViewController

- (instancetype) init {
    self = [super init];
    if (self) {
//
    }
    return self;
}
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
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    self.listLoader = [[NewsListLoader alloc] init];
    
    __weak typeof(self) weakSelf = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<NewsModel *> * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.dataArray = dataArray;
        //刷新列表
        [strongSelf.tableView reloadData];
    }];
     
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
    return _dataArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId"];
        cell.delegate = self;
    }
    [cell layoutTableViewCellWithModel:_dataArray[indexPath.row]];
//    cell.imageView.image = [UIImage imageNamed:@"star_unselected.png"];
//    cell.textLabel.text = @"主标题";
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"单元格 %d", indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NewsModel *itemModel = self.dataArray[indexPath.row];
    
    NewsDetailViewController *controller = [[NewsDetailViewController alloc] initWithUrl:itemModel.url];
    controller.view.backgroundColor = [UIColor whiteColor];
    controller.title = [NSString stringWithFormat:@"%@", itemModel.title];
    
    [self.navigationController pushViewController:controller animated:YES];
    
    //标记已读
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:itemModel.url];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (void)tableViewCell:(nonnull UITableViewCell *)tableViewCell clickDelBtn:(nonnull UIButton *)delBtn {
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        delBtn.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        delBtn.transform = CGAffineTransformIdentity; //恢复原大小
    }];
    
    NewsDeleteCellView *deleteView = [[NewsDeleteCellView alloc] initWithFrame:self.view.bounds];
   
    CGRect rect = [tableViewCell convertRect:delBtn.frame toView:nil];
    
    //处理block的循环饮用
    __weak typeof(self) weakSelf = self;
    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
        __strong typeof(self) strongSelf = weakSelf;
        NSIndexPath *indexPath = [strongSelf.tableView indexPathForCell:tableViewCell];
//        [strongSelf.dataArray removeObjectAtIndex:indexPath.row];
        //删除cell
        [strongSelf.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

@end
