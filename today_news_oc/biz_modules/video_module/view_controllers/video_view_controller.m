//
//  video_view_controller.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/3.
//

#import <Foundation/Foundation.h>
#import "video_view_controller.h"

@interface VideoViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>

- (void)buildViews;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildViews];
}

- (void)buildViews {
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayOut];
    
    flowLayOut.minimumLineSpacing = 10; //行间距
    flowLayOut.minimumInteritemSpacing = 20; //单元格列最小间距
    double itemW = (self.view.frame.size.width - 20) / 2;
    double itemH = 300;
    flowLayOut.itemSize = CGSizeMake(itemW, itemH);
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [self.view addSubview:collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item % 3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 80);
    } else {
        return CGSizeMake((self.view.frame.size.width - 20) / 2, 300);
    }
}
@end
