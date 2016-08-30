//
//  BSUserTableViewCell.m
//  BSBDJ
//
//  Created by ma c on 16/8/29.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSUserTableViewCell.h"

@interface BSUserTableViewCell ()

/**头像*/
@property (weak, nonatomic) IBOutlet UIImageView *header;
/**昵称*/
@property (weak, nonatomic) IBOutlet UILabel *screen_name;
/**粉丝数*/
@property (weak, nonatomic) IBOutlet UILabel *fans_count;
/**关注按钮*/
@property (weak, nonatomic) IBOutlet UIButton *notice;

@end

@implementation BSUserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     self.backgroundColor = SFColor(244, 244, 244);
    
}

- (void)setUserItem:(BSUserItem *)userItem {

    _userItem = userItem;
    [self.header sd_setImageWithURL:[NSURL URLWithString:userItem.header]];
    self.screen_name.text = userItem.screen_name;
    
    if (userItem.fans_count < 10000) {
        
        self.fans_count.text  = [NSString stringWithFormat:@"%ld人", userItem.fans_count];
    } else {
        NSString *fans = [NSString stringWithFormat:@"%zd万人", userItem.fans_count / 10000];
        self.fans_count.text = fans;
    }


    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
