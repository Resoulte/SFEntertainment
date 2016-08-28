//
//  UIBarButtonItem+SFExtension.h
//  BSBDJ
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SFExtension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlighted:(NSString *)highlightedImage target:(id)target action:(SEL)action;

@end
