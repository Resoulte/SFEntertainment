//
//  BSRecommendItem.m
//  BSBDJ
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSRecommendItem.h"

@implementation BSRecommendItem

- (NSMutableArray *)users {
    
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}

@end
