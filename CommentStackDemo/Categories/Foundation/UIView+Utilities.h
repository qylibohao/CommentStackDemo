//
//  UIView+XSJUtilities.h
//  XSJGame
//
//  Created by dingpo zhou on 14-7-28.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Utilities)

@property (nonatomic, readonly) CGFloat left;
@property (nonatomic, readonly) CGFloat top;
@property (nonatomic, readonly) CGFloat right;
@property (nonatomic, readonly) CGFloat bottom;

@property (nonatomic, readonly) CGFloat width;
@property (nonatomic, readonly) CGFloat height;

- (void)setViewLeft:(CGFloat)x;
- (void)setViewTop:(CGFloat)y;
- (void)setViewWidth:(CGFloat)width;
- (void)setViewHeight:(CGFloat)height;

- (void)addTapAction:(id)target selector:(SEL)selector;

- (UIViewController *)viewController;

- (void)setCornerRadius:(CGFloat)cornerRadius;

@end
