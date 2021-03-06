//
//  BSEssenceViewController.m
//  BSBDJ
//
//  Created by ma c on 16/8/27.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSEssenceViewController.h"
#import "BSEssenceRecommendTagsController.h"
#import "BSTopicsTableViewController.h"

@interface BSEssenceViewController () <UIScrollViewDelegate>
/**头部标题栏*/
@property (strong, nonatomic) UIView *headerView;
/**底部红色指示器*/
@property (strong, nonatomic) UIView *redView;
/**记录选中的titleBtn*/
@property (strong, nonatomic) UIButton *beforeBtn;
/**scrolleView*/
@property (strong, nonatomic) UIScrollView *contentView;

@end

@implementation BSEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏
    [self setupNavigationItem];
    
    // 初始化子控制器
    [self setupAllChildViewController];
    
    // 设置头部标题
    [self setuopHeaderTitle];
    
    // 设置底部的scrollView
    [self setupContentView];
    
    
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
//    self.edgesForExtendedLayout = 0;
    
    UIView *headerView = [[UIView alloc] init];
    self.headerView = headerView;
    headerView.sf_width = SFScreenWidth;
    headerView.sf_height = SFHeaderViewH; 
    // 方法2
    headerView.sf_y = SFHeaderViewY;
    headerView.backgroundColor = SFColor_A(243, 240, 237, 0.6);
    [self.view addSubview:headerView];
    
    
    
    // 底部红色指示器
    UIView *redView = [[UIView alloc] init];
    self.redView = redView;
    redView.tag = -1;
    redView.sf_height = 2;
    redView.sf_y = headerView.sf_height - redView.sf_height;
    redView.backgroundColor = [UIColor redColor];
    
    
    // 设置里面的子内容
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = SFScreenWidth / self.childViewControllers.count;
    CGFloat titleH = headerView.sf_height;
    
    for (int i = 0; i < self.childViewControllers.count; i ++) {
        
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.tag = i;
        
        titleX = i * titleW;
        titleBtn.frame = CGRectMake(titleX, titleY, titleW, titleH);
        SFLog(@"%@", titleBtn);
        UIViewController *vc = self.childViewControllers[i];
        [titleBtn setTitle:vc.title forState:UIControlStateNormal];
        [titleBtn layoutIfNeeded];
        [titleBtn setTitleColor:SFColor(133, 133, 133) forState:UIControlStateNormal];
        [titleBtn setTitleColor:SFColor(255, 0, 6) forState:UIControlStateSelected]; // UIControlStateDisabled];
        [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 默认点击第一个按钮
        if (i == 0) {
            
            titleBtn.selected = YES;
            self.beforeBtn = titleBtn;
            // 让btn内部的lable根据文字内容来计算
            [titleBtn.titleLabel sizeToFit];
            redView.sf_width = titleBtn.titleLabel.sf_width;
            redView.sf_centerX = titleBtn.sf_centerX;

        }
        
        [headerView addSubview:titleBtn];
    }
    [headerView addSubview:redView];
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
    
    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = titleBtn.tag * self.contentView.sf_width;
    [self.contentView setContentOffset:offset animated:YES];
    
}

/**setupContentView*/
- (void)setupContentView {
    // 不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contenScrollView = [[UIScrollView alloc] init];
    self.contentView = contenScrollView;
    contenScrollView.delegate = self;
    contenScrollView.pagingEnabled = YES;
    contenScrollView.frame = self.view.bounds;
    
    CGFloat contentW = self.childViewControllers.count * SFScreenWidth;
    contenScrollView.contentSize = CGSizeMake(contentW, 0);
    
    [self.view insertSubview:contenScrollView atIndex:0];
    
    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contenScrollView];
}

/**初始化子控制器*/
- (void)setupAllChildViewController {
     BSTopicsTableViewController *all = [[BSTopicsTableViewController alloc] init];
    all.title = @"全部";
    all.topicsType = SFTopicTypeAll;
    [self addChildViewController:all];
    
    BSTopicsTableViewController *word = [[BSTopicsTableViewController alloc] init];
    word.title = @"段子";
    word.topicsType = SFTopicTypeWord;
    [self addChildViewController:word];
    
    BSTopicsTableViewController *video = [[BSTopicsTableViewController alloc] init];
    video.title = @"视频";
    video.topicsType = SFTopicTypeVideo;
    [self addChildViewController:video];
    
    BSTopicsTableViewController *image = [[BSTopicsTableViewController alloc] init];
    image.title = @"图片";
    image.topicsType = SFTopicTypeImage;
    [self addChildViewController:image];
    
    BSTopicsTableViewController *voice = [[BSTopicsTableViewController alloc] init];
    voice.title = @"声音";
    voice.topicsType = SFTopicTypeVoice;
    [self addChildViewController:voice];
    
    
    
    
}

- (void)tagClick {

    BSEssenceRecommendTagsController *tags = [[BSEssenceRecommendTagsController alloc] init];
    
    [self.navigationController pushViewController:tags animated:YES];
    
}

#pragma mark - UIScrollViewDelegate 
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    // 当前的索引
    NSInteger index = scrollView.contentOffset.x / SFScreenWidth;
    
    // 取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.sf_x = scrollView.contentOffset.x;
    // 控制器的y值默认是20
    vc.view.sf_y = 0;
    // 设置控制器view的高度是整个屏幕的高度
    vc.view.sf_height = scrollView.sf_height;
    
   
    
    [scrollView addSubview:vc.view];

} 
 
// 滑动时titile改变
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    [self scrollViewDidEndScrollingAnimation:scrollView];
    

    NSInteger index = scrollView.contentOffset.x / SFScreenWidth;
    [self titleClick:self.headerView.subviews[index]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}


@end
