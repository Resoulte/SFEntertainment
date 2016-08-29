//
//  BSUserTableViewCell.h
//  BSBDJ
//
//  Created by ma c on 16/8/29.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSUserItem.h"

@interface BSUserTableViewCell : UITableViewCell

/**用户模型*/
@property (strong, nonatomic) BSUserItem *userItem;

@end
