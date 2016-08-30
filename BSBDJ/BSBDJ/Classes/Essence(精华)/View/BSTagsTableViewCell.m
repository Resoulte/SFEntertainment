//
//  BSTagsTableViewCell.m
//  BSBDJ
//
//  Created by ma c on 16/8/30.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSTagsTableViewCell.h"


@interface BSTagsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *subName;



@end

@implementation BSTagsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTagsItem:(BSTagsItem *)tagsItem {

    _tagsItem = tagsItem;
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:tagsItem.image_list]];
    self.nameLable.text = tagsItem.theme_name;
    self.subName.text = [NSString stringWithFormat:@"%ld人订阅", tagsItem.sub_number];
    
}

- (void)setFrame:(CGRect)frame {

    frame.origin.x = 5;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 1;
    
    [super setFrame:frame];
}

@end
