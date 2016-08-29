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

// 重写push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *buttonItem = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonItem.sf_size = CGSizeMake(70, 20);
//        buttonItem.backgroundColor = [UIColor redColor];
//        [buttonItem sizeToFit];
        
        // 让内部按钮的所有内容向左对齐
        buttonItem.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        buttonItem.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        
        [buttonItem setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [buttonItem setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [buttonItem setTitle:@"返回" forState:UIControlStateNormal];
        [buttonItem setTitleColor:SFColor(18, 18, 18) forState:UIControlStateNormal];
        [buttonItem setTitleColor:SFColor(233, 42, 35) forState:UIControlStateHighlighted];
        [buttonItem addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonItem];
    }
    
    
    [super pushViewController:viewController animated:animated];
}

- (void)back {

    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
