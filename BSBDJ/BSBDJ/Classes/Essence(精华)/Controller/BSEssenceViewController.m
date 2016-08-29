//
//  BSEssenceViewController.m
//  BSBDJ
//
//  Created by ma c on 16/8/27.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSEssenceViewController.h"

@interface BSEssenceViewController ()
/**底部红色指示器*/
@property (strong, nonatomic) UIView *redView;
/**记录选中的titleBtn*/
@property (strong, nonatomic) UIButton *beforeBtn;
@end

@implementation BSEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏
    [self setupNavigationItem];
    
    // 设置头部标题
    [self setuopHeaderTitle];
    
}

/**设置导航栏*/
- (void)setupNavigationItem {

    // 设置titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置leftBarButtonItem
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlighted:@"MainTagSubIconClick" target:self action:@selector(tagClick)];

}

/**设置头部标题*/
- (void)setuopHeaderTitle {
    // 从导航栏下开始计算（方法1）
    self.edgesForExtendedLayout = 0;
    
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SFScreenWidth, 35)];
    // 方法2
//    headerView.sf_y = 64;
    headerView.backgroundColor = SFColor(243, 240, 237);
    [self.view addSubview:headerView];
    
    // 底部红色指示器
    UIView *redView = [[UIView alloc] init];
    self.redView = redView;
    redView.sf_height = 2;
    redView.sf_y = headerView.sf_height - redView.sf_height;
    redView.backgroundColor = [UIColor redColor];
    [headerView addSubview:redView];
    
    // 设置里面的子内容
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = SFScreenWidth / 5;
    CGFloat titleH = headerView.sf_height;
    
    NSArray *childTitle = @[@"全部", @"视频", @"图片", @"段子", @"声音"];
    for (int i = 0; i < 5; i ++) {
        
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleX = i * titleW;
        titleBtn.frame = CGRectMake(titleX, titleY, titleW, titleH);
        SFLog(@"%@", titleBtn);
        [titleBtn setTitle:childTitle[i] forState:UIControlStateNormal];
        [titleBtn layoutIfNeeded];
        [titleBtn setTitleColor:SFColor(133, 133, 133) forState:UIControlStateNormal];
        [titleBtn setTitleColor:SFColor(255, 0, 6) forState:UIControlStateSelected]; // UIControlStateDisabled];
        [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 默认点击第一个按钮
        if (i == 0) {
            
            titleBtn.selected = YES;
            
            // 让btn内部的lable根据文字内容来计算
            [titleBtn.titleLabel sizeToFit];
            redView.sf_width = titleBtn.titleLabel.sf_width;
            redView.sf_centerX = titleBtn.sf_centerX;

        }
        
        [headerView addSubview:titleBtn];
    }
    
    
    
}

/**点击标题*/
- (void)titleClick:(UIButton *)titleBtn {
    
    self.beforeBtn.selected = NO;
    titleBtn.selected = YES;
    self.beforeBtn = titleBtn;
    
//    self.beforeBtn.enabled = YES;
//    btn.enabled = NO;
//    self.beforeBtn = btn;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.redView.sf_width = titleBtn.titleLabel.sf_width;
        self.redView.sf_centerX = titleBtn.sf_centerX;
        
    }];
    
}

- (void)tagClick {

    SFLOGFUNC;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
