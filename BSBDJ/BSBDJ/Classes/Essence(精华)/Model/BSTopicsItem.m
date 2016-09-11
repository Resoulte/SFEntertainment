//
//  BSTopicsItem.m
//  BSBDJ
//
//  Created by ma c on 16/9/9.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSTopicsItem.h"



@implementation BSTopicsItem

{
    CGFloat _cellHeight;
}

- (NSString *)create_time {
    
    // 日期格式化类
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 帖子的创建时间
    NSDate *creat = [formatter dateFromString:_create_time];
    
    if (creat.isThisYear) { // 今年
        if (creat.isToday) { //今天
            NSDateComponents *components = [creat deltaFrome:[NSDate date]];
            if (components.hour >= 1) { // 时间差距 >= 1h
                
                return [NSString stringWithFormat:@"%zd小时前", components.hour];
            } else if (components.minute >= 1) { // 时间差距 >= 1分钟
                return [NSString stringWithFormat:@"%zd分钟前", components.minute];
            } else { // 1分钟 > 时间差距
                return @"刚刚";
            }
        } else if (creat.isYeaterday) { // 昨天
        formatter.dateFormat = @"昨天 HH:mm:ss";
            return [formatter stringFromDate:creat];
        } else { // 其他
            formatter.dateFormat = @"MM-dd HH:mm:ss";
            return [formatter stringFromDate:creat];
        }
        
    } else { // 非今年
        return _create_time;
    }
}



- (CGFloat)cellHeight {

    if (!_cellHeight) {
    // 文字的y值
    CGFloat textY = 55;
    // 过期了
    //    [topics.text sizeWithFont:<#(UIFont *)#> constrainedToSize:<#(CGSize)#>]
    CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(SFScreenWidth - 40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:13]} context:nil].size.height;
    
    // cell的高度
    _cellHeight = SFTopicCellTextY + textH + SFTopicCellBottomBarH + 2 * SFTopicCellMargin;
    
    }
    return _cellHeight;
}

@end
