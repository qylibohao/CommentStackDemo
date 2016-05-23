//
//  StackTableViewCell.h
//  CommentStackDemo
//
//  Created by libohao on 16/3/28.
//  Copyright © 2016年 libohao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StackTableViewCell : UITableViewCell

- (void)setupCellWith:(NSArray*)array;


+ (CGFloat)heightForCellWith:(NSArray*)array;
+ (CGFloat)widthForStackAtIndex:(NSInteger)index TotalCount:(NSInteger)total;

@end
