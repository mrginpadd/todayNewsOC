//
//  news_tableview_cell.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/4.
//

#import "news_tableview_cell.h"
#import "news_delete_cell_view.h"
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
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 50, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 70, 70)];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView.backgroundColor = [UIColor redColor];
            self.rightImageView;
        })];
        
        [self.contentView addSubview:({
            self.deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(260, 80, 30, 20)];
            [self.deleteBtn setTitle:@"X" forState:UIControlStateNormal];
            [self.deleteBtn setTitle:@"V" forState:UIControlStateHighlighted];
            
            self.deleteBtn.backgroundColor = [UIColor blueColor];
            
            [self.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            self.deleteBtn;
        })];
    }
    
    return self;
}

- (void) layoutTableViewCell {
    self.titleLabel.text = @"即可时间";
    self.sourceLabel.text = @"新浪";
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"1888评论";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 10, self.sourceLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = @"三分钟前";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 10, self.commentLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    self.rightImageView.image = [UIImage imageNamed:@"home_selected.png"];
}

- (void) deleteBtnClick:(UIButton *)sender {
    NSLog(@"deleteBtnClick");
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDelBtn:)]) {
        [self.delegate tableViewCell:self clickDelBtn:self.deleteBtn];
    }
}
@end
