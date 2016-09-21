//
//  BSTopicsImageView.m
//  BSBDJ
//
//  Created by ma c on 16/9/12.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSTopicsImageView.h"

@interface BSTopicsImageView ()
/**gif*/
@property (weak, nonatomic) IBOutlet UIImageView * gifImage;
/**内容图片*/
@property (weak, nonatomic) IBOutlet UIImageView * contentImage ;






@end

@implementation BSTopicsImageView

+ (instancetype)pictureView {

    return [[[NSBundle mainBundle] loadNibNamed:@"BSTopicsImageView" owner:nil options:nil] lastObject];
}

- (void)setTopicItem:(BSTopicsItem *)topicItem {
    _topicItem = topicItem;
    
    // 设置图片
    [self.contentImage sd_setImageWithURL:[NSURL URLWithString:topicItem.large_image]];
}

@end
