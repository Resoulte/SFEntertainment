//
//  BSTopicsTableViewController.h
//  BSBDJ
//
//  Created by ma c on 16/9/11.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SFTopicType) {
    SFTopicTypeAll = 1,
    SFTopicTypeImage = 10,
    SFTopicTypeWord = 29,
    SFTopicTypeVoice = 31,
    SFTopicTypeVideo = 41
};

@interface BSTopicsTableViewController : UITableViewController

/**帖子类型*/
@property (assign, nonatomic) SFTopicType topicsType;

@end
