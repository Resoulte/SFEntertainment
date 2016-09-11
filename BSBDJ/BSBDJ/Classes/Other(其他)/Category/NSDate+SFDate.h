//
//  NSDate+SFDate.h
//  BSBDJ
//
//  Created by ma c on 16/9/11.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SFDate)

/**
 *  比较from和self的时间差
 */
- (NSDateComponents *)deltaFrome:(NSDate *)from;

/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  是否为今天
 */
- (BOOL)isToday;

/**
 *  是否为昨天
 */
- (BOOL)isYeaterday;


@end
