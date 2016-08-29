//
//  BSCategoryCell.h
//  BSBDJ
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSRecommendItem.h"

@interface BSCategoryCell : UITableViewCell

/**category模型数据*/
@property (strong, nonatomic) BSRecommendItem *categoryItem;

/**数据数组*/
@property (strong, nonatomic) NSArray *dataArray;

@end
