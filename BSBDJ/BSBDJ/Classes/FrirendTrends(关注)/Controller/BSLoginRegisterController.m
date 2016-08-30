//
//  BSLoginRegisterController.m
//  BSBDJ
//
//  Created by ma c on 16/8/29.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSLoginRegisterController.h"


@interface BSLoginRegisterController ()
// 登录框距离左边的间距
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeftMargin;
@end

@implementation BSLoginRegisterController
- (IBAction)loginregister:(id)sender {
    if (self.loginViewLeftMargin.constant == 0) {
        // 显示注册
        self.loginViewLeftMargin.constant = - SFScreenWidth;
    } else {
    // 显示登录界面
        self.loginViewLeftMargin.constant = 0;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}
- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

- (UIStatusBarStyle)preferredStatusBarStyle {

    return UIStatusBarStyleLightContent;
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
