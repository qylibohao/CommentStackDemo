//
//  UILabel+Additions.m
//  JackFastKit
//
//  Created by kingsoft_ios on 14/12/25.
//  Copyright (c) 2014年 华捷 iOS软件开发工程师 曾宪华. All rights reserved.
//

#import "UILabel+Additions.h"
#import "NSString+Additions.h"

@implementation UILabel (Additions)

#pragma mark - Resizable

- (CGRect)resizablesWithDefaultMaxHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size = [self.text resizablesWithFont:self.font defaultMaxHeight:height];
    self.frame = frame;
    return frame;
}

- (void)resizablesWithDefaultMaxWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size = [self.text resizablesWithFont:self.font defaultMaxWidth:width];
    self.frame = frame;
}

- (void)resizablesWithDefaultMaxSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = [self.text resizablesWithFont:self.font defaultMaxSize:size];
    self.frame = frame;
}

- (CGSize)textSizeWithMaxWidth:(CGFloat)width
{
    return [self.text resizablesWithFont:self.font defaultMaxWidth:width];
}

@end
