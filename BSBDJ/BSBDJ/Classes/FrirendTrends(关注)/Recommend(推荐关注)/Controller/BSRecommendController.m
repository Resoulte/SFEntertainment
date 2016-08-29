//
//  BSRecommendController.m
//  BSBDJ
//
//  Created by ma c on 16/8/28.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSRecommendController.h"
#import "BSRecommendItem.h"
#import "BSCategoryCell.h"
#import "BSUserTableViewCell.h"

@interface BSRecommendController () <UITableViewDelegate, UITableViewDataSource>
/**左边的TabView*/
@property (weak, nonatomic) IBOutlet UITableView *categoryTablview;
/**左边数据数组*/
@property (strong, nonatomic) NSArray *categoryArray;
/**右边的tablView*/
@property (weak, nonatomic) IBOutlet UITableView *categoryRecommendTabView;
/**右边的数据数组*/
@property (strong, nonatomic) NSMutableArray *recommendArray;
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
    
}

#pragma mark - 推荐关注的左边category的网络请求
- (void)categoryRequestHttp {
    
    [self getWithPath:@"api/api_open.php" params:@{@"a" : @"category", @"c" : @"subscribe"} success:^(id json) {
        SFLog(@"%@", json);
        self.categoryArray = [NSArray yy_modelArrayWithClass:[BSRecommendItem class] json:json[@"list"]];
        
        // 刷新数据
        [self.categoryTablview reloadData];
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 推荐关注的右边的网络请求
- (void)recommendRequestHttp {
    
}


#pragma mark - UITableViewDataSource 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.categoryTablview) {
        return self.categoryArray.count;
    } else
        return self.recommendArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.categoryTablview) {
        BSCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        cell.categoryItem = self.categoryArray[indexPath.row];
        
        return cell;
    } else {
        BSUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID1];
        cell.userItem = self.recommendArray[indexPath.row];
        
        return cell;
    }
        
    
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    BSRecommendItem *category = self.categoryArray[indexPath.row];
//    category.id
    [self getWithPath:@"api/api_open.php" params:@{@"a" : @"category", @"c" : @"subscribe", @"category_id" : @(category.id)} success:^(id json) {
        SFLog(@"%@", json);
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - setter and getter 
- (NSMutableArray *)recommendArray {
    
    if (!_recommendArray) {
        _recommendArray = [NSMutableArray array];
    }
    return _recommendArray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
