//
//  BSRecommendController.m
//  BSBDJ
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSRecommendController.h"
#import "BSRecommendItem.h"
#import "BSUserItem.h"
#import "BSCategoryCell.h"
#import "BSUserTableViewCell.h"

#define BSSelectedCategory self.categoryArray[self.categoryTablview.indexPathForSelectedRow.row]

@interface BSRecommendController () <UITableViewDelegate, UITableViewDataSource>
/**左边的TabView*/
@property (weak, nonatomic) IBOutlet UITableView *categoryTablview;
/**左边数据数组*/
@property (strong, nonatomic) NSArray *categoryArray;
/**右边的tablView*/
@property (weak, nonatomic) IBOutlet UITableView *categoryRecommendTabView;
/**BSCategoryCell*/
@property (strong, nonatomic) BSCategoryCell *categoryCell;
/**BSUserTableViewCell*/
@property (strong, nonatomic) BSUserTableViewCell *userCell;

@end

static NSString * const ID = @"category";
static NSString *const  ID1 = @"user";
@implementation BSRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐关注";
    self.categoryTablview.backgroundColor = SFColor(244, 244, 244);
    
    [self categoryRequestHttp];
    
    [self.categoryTablview registerNib:[UINib nibWithNibName:NSStringFromClass([BSCategoryCell class]) bundle:nil] forCellReuseIdentifier:ID];
    [self.categoryRecommendTabView registerNib:[UINib nibWithNibName:NSStringFromClass([BSUserTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID1];
    
    self.categoryRecommendTabView.rowHeight = 70;
    // 设置inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTablview.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.categoryRecommendTabView.contentInset = self.categoryTablview.contentInset;
    
    // 刷新
    [self refresh];
    
}

- (void)refresh {
    
    self.categoryRecommendTabView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

    self.categoryRecommendTabView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    self.categoryRecommendTabView.mj_footer.hidden = YES;
}

// 加载新数据
- (void)loadNewData {
    
    BSRecommendItem *category = BSSelectedCategory;
    
    //  设置当前页码为1
    category.curentPage = 1;

    // 发送请求加载更多数据
    [self getWithPath:@"api/api_open.php" params:@{@"a" : @"list", @"c" : @"subscribe", @"category_id" : @(category.id), @"page" : @(category.curentPage)} success:^(id json) {
        //        SFLog(@"%@", json[@"list"]);
        NSArray *recommendArray = [NSArray yy_modelArrayWithClass:[BSUserItem class] json:json[@"list"]];
        
        // 清除所有旧数据
        [category.users removeAllObjects];
        
        // 添加到当前类别对应的用户数组
        [category.users addObjectsFromArray:recommendArray];
        
        // 保存总数
        category.total = [json[@"total"] integerValue];
        
        // 刷新右边表格
        [self.categoryRecommendTabView reloadData];
        
        // 结束刷新
        [self.categoryRecommendTabView.mj_header endRefreshing];
        
        // 结束底部刷新
        [self checkFooterState];
    } failure:^(NSError *error) {
        
        // 结束刷新
        [self.categoryRecommendTabView.mj_header endRefreshing];
        
    }];
    

    
}

// 加载更多数据
- (void)loadMoreData {
    
    BSRecommendItem *category = BSSelectedCategory;
    
    // 发送请求加载更多数据
    [self getWithPath:@"api/api_open.php" params:@{@"a" : @"list", @"c" : @"subscribe", @"category_id" : @(category.id), @"page" : @(++category.curentPage)} success:^(id json) {
        //        SFLog(@"%@", json[@"list"]);
        NSArray *recommendArray = [NSArray yy_modelArrayWithClass:[BSUserItem class] json:json[@"list"]];
        
        // 添加到当前类别对应的用户数组
        [category.users addObjectsFromArray:recommendArray];
        
        // 刷新右边表格
        [self.categoryRecommendTabView reloadData];
        
        // 让底部控件结束刷新
        [self checkFooterState];
        
    } failure:^(NSError *error) {
        // 让底部控件结束刷新
        [self.categoryRecommendTabView.mj_footer endRefreshing];

    }];
    
    
}

#pragma mark - 推荐关注的左边category的网络请求
- (void)categoryRequestHttp {
    
    [self getWithPath:@"api/api_open.php" params:@{@"a" : @"category", @"c" : @"subscribe"} success:^(id json) {
//        SFLog(@"%@", json);
        self.categoryArray = [NSArray yy_modelArrayWithClass:[BSRecommendItem class] json:json[@"list"]];
        
        // 刷新数据
        [self.categoryTablview reloadData];
        
        
        // 默认选中首行
        [self.categoryTablview selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];

        
    } failure:^(NSError *error) {
        
    }];
}

// 时刻检测footer状态
- (void)checkFooterState {
    
    BSRecommendItem *category = BSSelectedCategory;
    // 每次刷新右边数据的时候，都控制footer的显示和隐藏
    self.categoryRecommendTabView.mj_footer.hidden = (category.users.count == 0);

    if (category.users.count == category.total) {
        [self.categoryRecommendTabView.mj_footer endRefreshingWithNoMoreData];
    } else {
        
        [self.categoryRecommendTabView.mj_footer endRefreshing];
    }

    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 左边的表格
    if (tableView == self.categoryTablview) return self.categoryArray.count;
    
    // 检测footer状态
    [self checkFooterState];
    
    // 右边的表格
    return [BSSelectedCategory users].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.categoryTablview) {
        BSCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        cell.categoryItem = self.categoryArray[indexPath.row];
        
        return cell;
    } else {
        BSUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID1];
        
        cell.userItem = [BSSelectedCategory users][indexPath.row];

        return cell;
    }
    
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    BSRecommendItem *category = self.categoryArray[indexPath.row];
    
    [self.categoryRecommendTabView.mj_footer endRefreshingWithNoMoreData];
    
    // 防止重复发送请求
    if (category.users.count) {
        // 显示曾经的数据
        [self.categoryRecommendTabView reloadData];
    } else {
        // 立即刷新表格, 不让用户看到上一个内容
        [self.categoryRecommendTabView reloadData];
        
        // 进入下拉刷新
        [self.categoryRecommendTabView.mj_header beginRefreshing];

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
