//
//  BSVertialButton.m
//  BSBDJ
//
//  Created by ma c on 16/8/30.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSVertialButton.h"

@implementation BSVertialButton

- (void)setupFrame {

}

- (void)awakeFromNib {

    [self setupFrame];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    // 调整图片
    self.imageView.sf_x = 0;
    self.imageView.sf_y = 0;
    self.imageView.sf_width = self.currentImage.size.width;
    self.imageView.sf_height = self.imageView.sf_width;
    
    // 调整文字
    self.titleLabel.sf_x = 0;
    self.titleLabel.sf_y = self.imageView.sf_height + 5;
    self.titleLabel.sf_width = self.imageView.sf_width;
    self.titleLabel.sf_height = self.sf_height - self.titleLabel.sf_y;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupFrame];
    }
    return self;
}

@end
