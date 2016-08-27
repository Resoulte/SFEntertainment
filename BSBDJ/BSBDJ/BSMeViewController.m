//
//  BSMeViewController.m
//  BSBDJ
//
//  Created by ma c on 16/8/27.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSMeViewController.h"

@interface BSMeViewController ()

@end

@implementation BSMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //  设置导航栏标题
    self.navigationItem.title = @"我的";
    
    // 设置rightBarButtonItems
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    settingBtn.size = settingBtn.currentBackgroundImage.size;
    [settingBtn addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside]
    ;
    UIButton *nightModeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nightModeBtn setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    [nightModeBtn setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
    nightModeBtn.size = nightModeBtn.currentBackgroundImage.size;
    [nightModeBtn addTarget:self action:@selector(ninghtModeClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:settingBtn], [[UIBarButtonItem alloc] initWithCustomView:nightModeBtn]];
}

- (void)settingClick {
    
    SFLOGFUNC;
}

- (void)ninghtModeClick {
    
    SFLOGFUNC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
