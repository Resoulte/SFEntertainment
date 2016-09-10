//
//  BSEssenceWordController.m
//  BSBDJ
//
//  Created by ma c on 16/8/29.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSEssenceWordController.h"
#import "BSTopicsItem.h"

@interface BSEssenceWordController ()

/**帖子数据*/
@property (strong, nonatomic) NSMutableArray *topicsArray;
/**当前页码*/
@property (assign, nonatomic) NSInteger page;
/**当加载下一页数据时需要这个参数*/
@property (copy, nonatomic) NSString *maxtime;
/**上一次的请求参数*/
@property (strong, nonatomic) NSDictionary *params;

@end

@implementation BSEssenceWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    // 添加刷新控件
    [self setupRefresh];
}
     
- (void)setupTableView {
    
    // 设置内边距
    // 设置的常量
    CGFloat top = SFHeaderViewY + SFHeaderViewH;
    CGFloat bottom = self.tabBarController.tabBar.sf_height;
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    
    // 设置滚动条的内边距
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
}

- (void)setupRefresh {
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    // 下拉加载
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}


- (void)loadNewData {
    
    
    // 结束上拉
    [self.tableView.mj_footer endRefreshing];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"29";
    self.params = params;
    
    [SFHttpTools getWithPath:@"api/api_open.php" params:params success:^(id json) {
        
        if (self.params != params) return ;
        
        // 存储maxtime
        self.maxtime = json[@"info"][@"maxtime"];
        
        self.topicsArray = [BSTopicsItem mj_objectArrayWithKeyValuesArray:json[@"list"]];
        
        // 生成plist文件便于观察
//        [json writeToFile:@"/Users/mac/Desktop/topics.plist" atomically:YES];
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        
        // 加载成功，清空页码
        self.page = 0;
        
    } failure:^(NSError *error) {
        
        if (self.params != params) return ;
        
        [self.tableView.mj_header endRefreshing];
    }];
    
    
}

- (void)loadMoreData {
    
    // 结束下拉
    [self.tableView.mj_header endRefreshing];
    
    self.page ++;
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"29";
    params[@"page"] = @(self.page);
    params[@"maxtime"] = self.maxtime;
    self.params = params;
    
    [SFHttpTools getWithPath:@"api/api_open.php" params:params success:^(id json) {
        
        if (self.params != params) return ;
        
        // 存储maxtime
        self.maxtime = json[@"info"][@"maxtime"];
        
        NSArray *dataArray = [BSTopicsItem mj_objectArrayWithKeyValuesArray:json[@"list"]];
#warning addObjectsFromArray谨记
        [self.topicsArray addObjectsFromArray:dataArray];
        
        [self.tableView reloadData];
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(NSError *error) {
        
        if (self.params != params) return ;
        
        [self.tableView.mj_footer endRefreshing];
        
        
        // 加载失败，恢复页码
        self.page --;
    }];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 检测上拉是否显示
    self.tableView.mj_footer.hidden = (self.topicsArray.count == 0);
    
    return self.topicsArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    BSTopicsItem *topicsItem = self.topicsArray[indexPath.row];
    cell.textLabel.text = topicsItem.name;
    cell.detailTextLabel.text = topicsItem.text;;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:topicsItem.profile_image]];
    
    
    return cell;
}

#pragma mark - setter and getter
- (NSMutableArray *)topicsArray {

    if (!_topicsArray) {
        _topicsArray = [NSMutableArray array];
    }
    return _topicsArray;
}

@end
