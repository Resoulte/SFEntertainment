//
//  NSDate+SFDate.m
//  BSBDJ
//
//  Created by ma c on 16/9/11.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "NSDate+SFDate.h"

@implementation NSDate (SFDate)

- (NSDateComponents *)deltaFrome:(NSDate *)from {
    
    // 日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 比较时间
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitSecond | NSCalendarUnitMinute;
    return [calendar components:unit fromDate:from toDate:self options:0];
}

- (BOOL)isThisYear {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return  nowYear == selfYear;
}

- (BOOL)isToday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *nowComponents = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfComponents = [calendar components:unit fromDate:self];
    
    return nowComponents.year == selfComponents.year && nowComponents.month == selfComponents.month && nowComponents.day == selfComponents.day;
}

- (BOOL)isYeaterday {
    
    // 2014-12-31 23:59:59 -> 2014-12-31
    // 2015-01-01 00:00:01 -> 2015-01-01
    
    // 日期格式化类
    NSDateFormatter *forma = [[NSDateFormatter alloc] init];
    forma.dateFormat = @"yyyy-MM--dd";
    
    NSDate *nowDate = [forma dateFromString:[forma stringFromDate:[NSDate date]]];
    NSDate *selfDate = [forma dateFromString:[forma stringFromDate:self]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    
    return components.year == 0 && components.month == 0 && components.day == 1;
}


@end
