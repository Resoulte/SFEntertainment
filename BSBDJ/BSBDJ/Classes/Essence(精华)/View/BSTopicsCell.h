//
//  BSTopicsCell.h
//  BSBDJ
//
//  Created by ma c on 16/9/10.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSTopicsItem.h"

@interface BSTopicsCell : UITableViewCell

/**帖子模型*/
@property (strong, nonatomic) BSTopicsItem *topicsItem;

@end
