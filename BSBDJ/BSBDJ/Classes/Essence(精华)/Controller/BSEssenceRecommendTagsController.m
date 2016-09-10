//
//  BSEssenceRecommendTagsController.m
//  BSBDJ
//
//  Created by ma c on 16/8/30.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSEssenceRecommendTagsController.h"
#import "BSTagsItem.h"
#import "BSTagsTableViewCell.h"

@interface BSEssenceRecommendTagsController ()

/**数据数组*/
@property (strong, nonatomic) NSArray *tagsArray;

@end

static NSString * const ID = @"tagsCell";
@implementation BSEssenceRecommendTagsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tableView
    [self setupTableView];
    
    [self tagsRequestHttp];
}

- (void)setupTableView {
    
    self.tableView.backgroundColor = SFMainColor;
    
    self.title = @"推荐标签";
    
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSTagsTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
}

- (void)tagsRequestHttp {

    NSDictionary *params = @{
                             @"a" : @"tag_recommend",
                             @"action" : @"sub",
                             @"c" : @"topic"
                             };
    [SFHttpTools getWithPath:@"api/api_open.php" params:params success:^(id json) {
        self.tagsArray = [BSTagsItem mj_objectArrayWithKeyValuesArray:json];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tagsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BSTagsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.tagsItem = self.tagsArray[indexPath.row];
    return cell;
}



@end
