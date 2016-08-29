//
//  BSUserItem.h
//  BSBDJ
//
//  Created by ma c on 16/8/29.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSUserItem : NSObject

/**昵称*/
@property (copy, nonatomic) NSString *screen_name;
/**粉丝数*/
@property (assign, nonatomic) NSInteger fans_count;
/**头像*/
@property (copy, nonatomic) NSString *header;

@end
