//
//  UIView+SFFrame.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/12.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SFFrame)


// @property 如果在分类里只会生成setter和getter方法的声明，不会生成成员属性
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;

@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;

@end
