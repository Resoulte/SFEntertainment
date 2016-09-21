//
//  BSTopicsImageView.h
//  BSBDJ
//
//  Created by ma c on 16/9/12.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSTopicsItem.h"

@interface BSTopicsImageView : UIView

+ (instancetype)pictureView;

/**帖子模型*/
@property (strong, nonatomic) BSTopicsItem *topicItem;

@end
