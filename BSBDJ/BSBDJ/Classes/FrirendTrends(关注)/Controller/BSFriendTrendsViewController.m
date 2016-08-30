//
//  BSFriendTrendsViewController.m
//  BSBDJ
//
//  Created by ma c on 16/8/27.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSFriendTrendsViewController.h"
#import "BSRecommendController.h"
#import "BSLoginRegisterController.h"

@interface BSFriendTrendsViewController ()

@end

@implementation BSFriendTrendsViewController
- (IBAction)loginRegisterClick:(id)sender {
    
    BSLoginRegisterController *login = [[BSLoginRegisterController alloc] init];
    
    [self presentViewController:login animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的关注";
//    self.title = @"我的关注"; // 连下面的tabbar一起改
    
    // 设置leftBarButtonItem
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"cellFollowIcon" highlighted:@"cellFollowClickIcon" target:self action:@selector(friendBtnClick)];
}

- (void)friendBtnClick {
    
    BSRecommendController *recommend = [[BSRecommendController alloc] init];
    
    [self.navigationController pushViewController:recommend animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
