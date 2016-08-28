//
//  BSNavViewController.m
//  BSBDJ
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSNavViewController.h"

@interface BSNavViewController ()

@end

@implementation BSNavViewController

// 第一次用的时候调用
+ (void)initialize {
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
