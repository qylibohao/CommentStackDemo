//
//  UILabel+Additions.h
//  JackFastKit
//
//  Created by kingsoft_ios on 14/12/25.
//  Copyright (c) 2014年 华捷 iOS软件开发工程师 曾宪华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Additions)

#pragma mark - Resizable

- (CGRect)resizablesWithDefaultMaxHeight:(CGFloat)height;

/**
 *  根据目标最大宽度进行重新调整Label的大小
 *
 *  @param width 目标最大宽度
 */
- (void)resizablesWithDefaultMaxWidth:(CGFloat)width;

/**
 *  根据目标最大Size进行重新调整Label的大小
 *
 *  @param size 目标最大Size
 */
- (void)resizablesWithDefaultMaxSize:(CGSize)size;

/**
 *  根据目标最大Size返回Label文字的size
 *
 */
- (CGSize)textSizeWithMaxWidth:(CGFloat)width;

@end
