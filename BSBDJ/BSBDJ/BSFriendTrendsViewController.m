//
//  BSFriendTrendsViewController.m
//  BSBDJ
//
//  Created by ma c on 16/8/27.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSFriendTrendsViewController.h"

@interface BSFriendTrendsViewController ()

@end

@implementation BSFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的关注";
//    self.title = @"我的关注"; // 连下面的tabbar一起改
    
    // 设置leftBarButtonItem
    UIButton *friendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [friendBtn setBackgroundImage:[UIImage imageNamed:@"cellFollowIcon"] forState:UIControlStateNormal];
    [friendBtn setBackgroundImage:[UIImage imageNamed:@"cellFollowClickIcon"] forState:UIControlStateHighlighted];
    friendBtn.size = friendBtn.currentBackgroundImage.size;
    [friendBtn addTarget:self action:@selector(friendBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:friendBtn];
}

- (void)friendBtnClick {
    
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
