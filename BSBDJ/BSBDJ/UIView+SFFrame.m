//
//  UIView+SFFrame.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/12.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "UIView+SFFrame.h"

@implementation UIView (SFFrame)

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

- (CGFloat)centerX {
    
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {

    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY {

    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {

    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

@end
