//
//  UIBarButtonItem+SFExtension.m
//  BSBDJ
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "UIBarButtonItem+SFExtension.h"

@implementation UIBarButtonItem (SFExtension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlighted:(NSString *)highlightedImage target:(id)target action:(SEL)action  {

    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [Btn setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    Btn.sf_size = Btn.currentBackgroundImage.size;
    [Btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:Btn];
}

@end
