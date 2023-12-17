//
//  news_tableview_cell.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/4.
//

#import "news_tableview_cell.h"
#import "news_delete_cell_view.h"
#import "NewsModel.h"
#import "SDWebImage.h"
#import "ScreenUtil.h"
@interface NewsTableViewCell ()
- (void) layoutTableViewCell;
- (void) deleteBtnClick;
@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;
@property(nonatomic, strong, readwrite) UIImageView *rightImageView;
@property(nonatomic, strong, readwrite) UIButton *deleteBtn;
@end

@implementation NewsTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
   
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:UIRect(20, 15, 270, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:UIRect(20, 80, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:UIRect(100, 80, 50, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:UIRect(150, 80, 50, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:UIRect(300, 15, 70, 70)];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
//            self.rightImageView.backgroundColor = [UIColor redColor];
            self.rightImageView;
        })];
        
        [self.contentView addSubview:({
            self.deleteBtn = [[UIButton alloc] initWithFrame:UIRect(260, 80, 30, 20)];
            [self.deleteBtn setTitle:@"X" forState:UIControlStateNormal];
            [self.deleteBtn setTitle:@"V" forState:UIControlStateHighlighted];
            
//            self.deleteBtn.backgroundColor = [UIColor blueColor];
            
            [self.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            // 利用Layer设置圆角
            self.deleteBtn.layer.cornerRadius = 10;
            self.deleteBtn.layer.masksToBounds = YES;
            
            self.deleteBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            self.deleteBtn.layer.borderWidth = 2;
            self.deleteBtn;
        })];
    }
    
    return self;
}

- (void) layoutTableViewCellWithModel:(NewsModel *)model {
    
    bool hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:model.url];
    if (hasRead) {
        self.titleLabel.textColor = [UIColor grayColor];
    } else {
        self.titleLabel.textColor = [UIColor blackColor];
    }
    self.titleLabel.text = model.title;
    self.sourceLabel.text = model.author_name;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = model.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = UIRect(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + UI(10), self.sourceLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = model.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = UIRect(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + UI(10), self.commentLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
//    self.rightImageView.image = [UIImage imageNamed:@"home_selected.png"];
#warning 这是高耗时操作，运行在主线程，不推荐使用
    //暂时用这个
//    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.thumbnail_pic_s]]];
    
    // 采用线程替代
//    NSThread *downloadImgThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.thumbnail_pic_s]]];
//
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            self.rightImageView.image = image;
//        });
//
//    }];
//    downloadImgThread.name = @"downloadImgThread";
//
//    [downloadImgThread start];
    
    //采用gcd
    //下载图片的非主线程。队列
//    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //操作UI的主线程 队列
//    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
//
//    dispatch_async(downloadQueue, ^{
//
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.thumbnail_pic_s]]];
//
//        dispatch_async(mainQueue, ^{
//            self.rightImageView.image = image;
//        });
//    });
    
    
    //使用sdwebimage库
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:model.thumbnail_pic_s] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];

    self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.rightImageView.clipsToBounds = YES; // 确保超出部分被裁剪
}

- (void) deleteBtnClick:(UIButton *)sender {
    NSLog(@"deleteBtnClick");
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDelBtn:)]) {
        [self.delegate tableViewCell:self clickDelBtn:self.deleteBtn];
    }
}
@end
