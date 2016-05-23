//
//  UITableViewCell+StackComment.m
//  CommentStackDemo
//
//  Created by libohao on 16/5/23.
//  Copyright © 2016年 libohao. All rights reserved.
//

#import "UITableViewCell+StackComment.h"
#import "StackMacros.h"


@implementation UITableViewCell (StackComment)

//根据缩进等级计算stack宽度
+ (CGFloat)widthForStackAtIndex:(NSInteger)index TotalCount:(NSInteger)total{
    if (index >= total) return 0;
    CGFloat width = 0;
    NSInteger level = 0;
    
    if(total <= 5) {
        level = index;
        
        CGFloat originLevelWidth = SCREEN_WIDTH - STACK_LEFT_MARGIN - STACK_RIGHT_MARGIN;
        width = originLevelWidth - (total - index - 1)*LINE_SPACE*2;
        
    }else {
        level = [self levelForIndex:index TotalCount:total];
        
        CGFloat originLevelWidth = SCREEN_WIDTH - STACK_LEFT_MARGIN - STACK_RIGHT_MARGIN;
        
        width = originLevelWidth - (TOTAL_LEVEL - level)*LINE_SPACE*2;
        
    }
    
    return width;
}

+ (CGFloat)offsetForStackAtIndex:(NSInteger)index TotalCount:(NSInteger)total {
    CGFloat offset = 0.0;
    if(total <= 5) {
        offset = (total - index - 1) * LINE_SPACE;
    }else {
        NSInteger level = [[self class]levelForIndex:index TotalCount:total];
        offset = (TOTAL_LEVEL - level)* LINE_SPACE;
    }
    return offset;
}

//计算缩进等级 0到4 越小越缩进
+ (NSInteger)levelForIndex:(NSInteger)index TotalCount:(NSInteger)total {
    
    NSInteger level = 0;
    if (index < total && total > 5) {
        level = total - index < 5 ? 5 - (total - index): 0;
        
    }else {
        level = index;
    }
    return level;
}

@end
