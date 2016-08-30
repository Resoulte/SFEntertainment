//
//  BSPushGuideView.m
//  BSBDJ
//
//  Created by ma c on 16/8/30.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSPushGuideView.h"

@implementation BSPushGuideView

+ (instancetype)guideView {

    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

+ (void)show {
    
    NSString *key = @"CFBundleShortVersionString";
    NSString *currentVersion = [NSBundle mainBundle]. infoDictionary[key];
    NSString *sandoxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    if (![currentVersion isEqualToString:sandoxVersion]) {
        BSPushGuideView *guide = [BSPushGuideView guideView];
        guide.frame = SFScreenBounds;
        [SFKeyWindow addSubview:guide];
        
        // 存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        // 马上存里面
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    
}

- (IBAction)ensureClick:(id)sender {
    
    [self removeFromSuperview];
}
@end
