//
//  BSTabBar.m
//  BSBDJ
//
//  Created by ma c on 16/8/27.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSTabBar.h"

@interface BSTabBar ()

/**发布按钮*/
@property (strong, nonatomic) UIButton *publishBtn;

@end

@implementation BSTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.publishBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _publishBtn.frame = CGRectMake(0, 0 , _publishBtn.currentBackgroundImage.size.width, _publishBtn.currentBackgroundImage.size.height);
    _publishBtn.center = CGPointMake(self.sf_width * 0.5, self.sf_height * 0.5);
    
    
    CGFloat buttonY = 0;
    CGFloat buttonW = self.sf_width / 5;
    CGFloat buttonH = self.sf_height ;
    NSInteger index = 0;
    
    for (UIView *btn in self.subviews) {
        
//        if (![btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        if (![btn isKindOfClass:[UIControl class]] || btn == self.publishBtn) continue;
        
        CGFloat buttonX = buttonW * ((index > 1) ? (index + 1) : index);
        
        btn.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        index ++;
    }

}

#pragma mark - setter and getter
- (UIButton *)publishBtn {

    if (!_publishBtn) {
        _publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        
    }
    return _publishBtn;
}
@end
