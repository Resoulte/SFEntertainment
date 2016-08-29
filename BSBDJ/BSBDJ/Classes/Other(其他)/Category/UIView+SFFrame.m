//
//  UIView+SFFrame.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/12.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "UIView+SFFrame.h"

@implementation UIView (SFFrame)

- (CGFloat)sf_height {
    return self.frame.size.height;
}

- (void)setSf_height:(CGFloat)sf_height{
    CGRect rect = self.frame;
    rect.size.height = sf_height;
    self.frame = rect;
}

- (CGFloat)sf_width {
    return self.frame.size.width;
}

- (void)setSf_width:(CGFloat)sf_width {
    CGRect rect = self.frame;
    rect.size.width = sf_width;
    self.frame = rect;
}

- (CGFloat)sf_x {
    return self.frame.origin.x;
}

- (void)setSf_x:(CGFloat)sf_x{
    CGRect rect = self.frame;
    rect.origin.x = sf_x;
    self.frame = rect;
}

- (CGFloat)sf_y {
    return self.frame.origin.y;
}

- (void)setSf_y:(CGFloat)sf_y {
    CGRect rect = self.frame;
    rect.origin.y = sf_y;
    self.frame = rect;
}

- (CGFloat)sf_centerX {
    
    return self.center.x;
}

- (void)setSf_centerX:(CGFloat)sf_centerX {

    CGPoint center = self.center;
    center.x = sf_centerX;
    self.center = center;
}

- (CGFloat)sf_centerY {

    return self.center.y;
}

- (void)setSf_centerY:(CGFloat)sf_centerY {

    CGPoint center = self.center;
    center.y = sf_centerY;
    self.center = center;
}

- (CGSize)sf_size {

    return self.frame.size;
}

- (void)setSf_size:(CGSize)sf_size {

    CGRect rect = self.frame;
    rect.size = sf_size;
    self.frame = rect;
}

@end
