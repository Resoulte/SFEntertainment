//
//  BSCategoryCell.m
//  BSBDJ
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSCategoryCell.h"

@interface BSCategoryCell ()
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

@end

@implementation BSCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = SFColor(244, 244, 244);
    self.selectedIndicator.backgroundColor = SFColor(219, 21, 26);
    
}

- (void)layoutSubviews {

    [super layoutSubviews];
    // 重新调整内部lable的frame
    self.textLabel.sf_y = 2;
    self.textLabel.sf_height = self.textLabel.sf_height - 2 * self.textLabel.sf_y;
}

- (void)setCategoryItem:(BSRecommendItem *)categoryItem {

    _categoryItem = categoryItem;
    self.textLabel.text = categoryItem.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    self.selectedIndicator.hidden = !selected;
    
    self.textLabel.textColor = selected ? SFColor(219, 21, 26) : SFColor(78, 78, 78);
}

@end
