//
//  UITableViewCell+StackComment.h
//  CommentStackDemo
//
//  Created by libohao on 16/5/23.
//  Copyright © 2016年 libohao. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UITableViewCell (StackComment)

+ (CGFloat)widthForStackAtIndex:(NSInteger)index TotalCount:(NSInteger)total;
+ (CGFloat)offsetForStackAtIndex:(NSInteger)index TotalCount:(NSInteger)total;
+ (NSInteger)levelForIndex:(NSInteger)index TotalCount:(NSInteger)total;
@end
