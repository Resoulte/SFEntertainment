//
//  BSRecommendItem.h
//  BSBDJ
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSRecommendItem : NSObject

/**名字*/
@property (copy, nonatomic) NSString * name;
/**数量*/
@property (assign, nonatomic) NSInteger count;
/**id*/
@property (assign, nonatomic) NSInteger id;


/**这个类别所对应的数据*/
@property (strong, nonatomic) NSMutableArray *users;

/**总数*/
@property (assign, nonatomic) NSInteger total;

// 自己加的
/**当前页码*/
@property (assign, nonatomic) NSInteger curentPage;
@end
