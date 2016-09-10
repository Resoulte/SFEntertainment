//
//  BSTopicsItem.h
//  BSBDJ
//
//  Created by ma c on 16/9/9.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSTopicsItem : NSObject

/** 名称 */
@property (nonatomic, copy) NSString *name;
/** 头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 文字内容 */
@property (nonatomic, copy) NSString *text;

@end
