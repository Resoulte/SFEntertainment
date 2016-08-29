//
//  UIView+SFFrame.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/12.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SFFrame)


// @property 如果在分类里只会生成setter和getter方法的声明，不会生成带有下划线成员属性
@property (assign, nonatomic) CGFloat sf_height;
@property (assign, nonatomic) CGFloat sf_width;
@property (assign, nonatomic) CGFloat sf_x;
@property (assign, nonatomic) CGFloat sf_y;
@property (assign, nonatomic) CGSize sf_size;
@property (assign, nonatomic) CGFloat sf_centerX;
@property (assign, nonatomic) CGFloat sf_centerY;

@end
