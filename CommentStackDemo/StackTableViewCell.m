//
//  StackTableViewCell.m
//  CommentStackDemo
//
//  Created by libohao on 16/3/28.
//  Copyright © 2016年 libohao. All rights reserved.
//

#import "StackTableViewCell.h"
#import "NSString+Additions.h"
#import "UILabel+Additions.h"
#import "UIColor+RandomColor.h"
#import "UIView+Utilities.h"
#import "MMPlaceHolder.h"
#import "StackMacros.h"
#import "UITableViewCell+StackComment.h"

//#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
//#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
//
//#define STACK_TOP_MARGIN 60
//#define STACK_BUTTOM_MARGIN 10
//
//#define STACK_LEFT_MARGIN 40
//#define STACK_RIGHT_MARGIN 10
//
//#define STACK_SPACE 5
//
//#define LABEL_MARGIN 10
//
//#define LABEL_HEIGHT 14
//
//#define LABEL_TOP_PADDING 10
//#define LABEL_BOTTOM_PADDING 10
//#define LABEL_LEFT_PADDING 7
//#define LABEL_RIGHT_PADDING 7
//
//#define CONTENT_STRING_TOP_PADDING 53
//#define CONTENT_STRING_BUTTOM_PADDING 10
//
//
//
//#define LINE_SPACE 3
//#define LINE_WIDTH 1
//
//
//#define TOTAL_LEVEL 4


@interface StackTableViewCell()

@property (nonatomic, strong) UILabel* titlelabel;
@property (nonatomic, strong) UILabel* locatioinLabel;
@property (nonatomic, strong) UILabel* contentLabel;

@property (nonatomic, strong) UIColor* titleColor;
@property (nonatomic, strong) UIColor* desStrColor;
@property (nonatomic, strong) UIColor* contentColor;

@end

@implementation StackTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.contentView.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:241/255.0 alpha:1];
        _titleColor = [UIColor colorWithRed:81/255.0 green:145/255.0 blue:210/255.0 alpha:1];
        _desStrColor = [UIColor colorWithRed:141/255.0 green:141/255.0 blue:141/255.0 alpha:1];
        _contentColor = [UIColor blackColor];
    }
    return self;
}

- (void)setupCellWith:(NSArray*)array {
    if (array.count == 0) return;
    
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj performSelector:@selector(removeFromSuperview)];
    }];
    
    UIView* contentView = nil;
    
    if (array.count == 1) {
        [array enumerateObjectsUsingBlock:^(NSString*  _Nonnull contentStr, NSUInteger idx, BOOL * _Nonnull stop) {
            [self createNormalContentViewWithAvatar:@"" Title:@"dkfkdj" Des:@"北京网友" Content:contentStr];
        }];
    }else {
        [self createNormalContentViewWithAvatar:@"" Title:@"dkfkdj" Des:@"北京网友" Content:array.lastObject];
        
        contentView = [[UIView alloc]initWithFrame:CGRectMake(STACK_LEFT_MARGIN, STACK_TOP_MARGIN, self.contentView.frame.size.width - STACK_LEFT_MARGIN - STACK_RIGHT_MARGIN, self.contentView.frame.size.height  - STACK_TOP_MARGIN)];
        [self.contentView addSubview:contentView];
        
        NSArray* subArray = [array subarrayWithRange:NSMakeRange(0, array.count - 1)];
        NSInteger count = subArray.count;
        
        [subArray enumerateObjectsUsingBlock:^(NSString*  _Nonnull contentStr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSInteger level = [[self class ]levelForIndex:idx TotalCount:count];
            NSInteger offset = [[self class ]offsetForStackAtIndex:idx TotalCount:count];
            CGFloat x  = offset;
            CGFloat y = offset;
            
            CGFloat width = [[self class] widthForStackAtIndex:idx TotalCount:count];
            //NSLog(@"width : %f -- Level : %d",width,level);
            CGFloat height = [[self class] contentViewHeightWithString:contentStr StackWidth:width TotalCount:count];
            
            UIView* borderView = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, height)];
            borderView.layer.borderColor = [UIColor lightGrayColor].CGColor;
            borderView.layer.borderWidth = LINE_WIDTH;
            borderView.userInteractionEnabled = NO;
            
            UIView* contentLabelView = [self createStackContentViewWithFrame:CGRectMake(x, y, width, height) Title:@"火星网友" Content:contentStr];
            
            if (contentView.subviews.count >= 2) {
                UIView* lastView = contentView.subviews.firstObject;
                [contentLabelView setViewTop:lastView.bottom];
                
                if (level != 0) {
                    [borderView setViewHeight:lastView.height + contentLabelView.height + LINE_SPACE - LINE_WIDTH];
                }else {
                    [borderView setViewHeight:lastView.height + contentLabelView.height];
                }
                
            }else {
                if (level != 0) {
                    [borderView setViewHeight: contentLabelView.height ];
                }else {
                    [borderView setViewHeight:contentLabelView.height];
                }
            }
            
            [contentView insertSubview:contentLabelView atIndex:0];
            //倒叙插入层叠view数组中
            [contentView insertSubview:borderView atIndex:0];
            
        }];
    }
    
    CGFloat fixWidth = [[self class]widthForStackAtIndex:array.count - 1 TotalCount:array.count];
    UILabel* contentLabel = [self createContentLabelFixWidth:fixWidth Content:array.lastObject];
    UIView* lastView = contentView.subviews.firstObject;
    if (lastView) {
        [contentLabel setViewTop:lastView.bottom + LABEL_TOP_PADDING];
        [contentView addSubview:contentLabel];
    }else {
        [contentLabel setViewLeft:STACK_LEFT_MARGIN];
        [contentLabel setViewTop:STACK_TOP_MARGIN];
        [self.contentView addSubview:contentLabel];
    }
}

- (UILabel *)createContentLabelFixWidth:(CGFloat)fixWidth Content:(NSString*)contentStr {
    UILabel* contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, fixWidth ,50)];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textColor = _contentColor;
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    contentLabel.numberOfLines = 0;
    contentLabel.text = contentStr;
    [contentLabel resizablesWithDefaultMaxWidth:fixWidth];
    
    return contentLabel;
}

- (void)createNormalContentViewWithAvatar:(NSString*)urlStr Title:(NSString*)titleStr Des:(NSString*)desStr Content:(NSString*)contentStr {
    UIImageView* avatarImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 14, 25, 25)];
    avatarImgView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:avatarImgView];
    
    UILabel* title = [[UILabel alloc]initWithFrame:CGRectMake(STACK_LEFT_MARGIN, 18, 200, 15)];
    title.font = [UIFont systemFontOfSize:12];
    title.textColor = _titleColor;
    title.text = titleStr;
    [self.contentView addSubview:title];
    
    UILabel* desLabel = [[UILabel alloc]initWithFrame:CGRectMake(STACK_LEFT_MARGIN, 38, 200, 12)];
    desLabel.font = [UIFont systemFontOfSize:11];
    desLabel.textColor = _desStrColor;
    desLabel.text = desStr;
    [self.contentView addSubview:desLabel];
    
}

- (UIView* )createStackContentViewWithFrame:(CGRect)frame Title:(NSString *)title Content:(NSString*)content{
    UIView* contentView = [[UIView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    UILabel* titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 13, frame.size.width, 15)];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = _titleColor;
    [contentView addSubview:titleLabel];
    
    titleLabel.text = title;
    
    UILabel* desLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, frame.size.width, 13)];
    desLabel.font = [UIFont systemFontOfSize:11];
    desLabel.textColor = _desStrColor;
    [contentView addSubview:desLabel];
    
    desLabel.text = @"北京市";
    
    UILabel* contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, frame.size.width - 14,frame.size.height - 50)];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textColor = _contentColor;
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    contentLabel.numberOfLines = 0;
    contentLabel.text = content;
    //contentLabel.backgroundColor = [UIColor redColor];
    [contentLabel resizablesWithDefaultMaxWidth:frame.size.width - LABEL_LEFT_PADDING - LABEL_RIGHT_PADDING];
    [contentView addSubview:contentLabel];
    
    //[contentView setViewHeight:CGRectGetMaxY(contentLabel.frame)+ CONTENT_STRING_BUTTOM_PADDING - LINE_WIDTH*2];
    [contentView setViewHeight:CGRectGetMaxY(contentLabel.frame)+ CONTENT_STRING_BUTTOM_PADDING ];

    return contentView;
}



+ (CGFloat)heightForCellWith:(NSArray*)array {
    if (!array.count) return 0;
    __block CGFloat totalHeight = 0;
    
    
    if (array.count > 1) {
        NSArray* subArray = [array subarrayWithRange:NSMakeRange(0, array.count - 1)];
        
        NSInteger totalLevel = [[self class]levelForIndex:subArray.count - 1 TotalCount:subArray.count] + 1;
        totalLevel = totalLevel > 4 ? 4 : totalLevel;
        
        totalHeight += totalLevel * (LINE_SPACE);
        
        [subArray enumerateObjectsUsingBlock:^(NSString*  _Nonnull contentStr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CGFloat fixWidth = [self widthForStackAtIndex:idx TotalCount:subArray.count] - LABEL_LEFT_PADDING - LABEL_RIGHT_PADDING;
            CGSize size = [contentStr resizablesWithFont:[UIFont systemFontOfSize:14] defaultMaxWidth:fixWidth];
            CGFloat singleStackHeight = size.height;
            singleStackHeight += CONTENT_STRING_TOP_PADDING;//标题高
            singleStackHeight += CONTENT_STRING_BUTTOM_PADDING;//底部间距
            
//            CGFloat height = [self contentViewHeightWithString:contentStr StackWidth:[self widthForStackAtIndex:idx TotalCount:array.count] TotalCount:array.count];
//            CGFloat singleStackHeight = height;
            
            singleStackHeight = singleStackHeight - (LINE_SPACE - LINE_WIDTH);
            
            totalHeight += singleStackHeight;
        }];
        
        totalHeight -= (array.count - 1);
        
        
        //叠加底层label高度
        CGFloat fixWidth = [self widthForStackAtIndex:array.count - 1 TotalCount:array.count];
        CGSize size = [array.lastObject resizablesWithFont:[UIFont systemFontOfSize:14] defaultMaxWidth:fixWidth];
        totalHeight += size.height;
        totalHeight += LABEL_TOP_PADDING + LABEL_BOTTOM_PADDING;
        
        totalHeight += STACK_TOP_MARGIN;
    }else {//等于1的时候
        //totalHeight += STACK_TOP_MARGIN;
        [array enumerateObjectsUsingBlock:^(NSString*  _Nonnull contentStr, NSUInteger idx, BOOL * _Nonnull stop) {
            CGFloat fixWidth = [self widthForStackAtIndex:idx TotalCount:array.count] - LABEL_LEFT_PADDING - LABEL_RIGHT_PADDING;
            CGSize size = [contentStr resizablesWithFont:[UIFont systemFontOfSize:14] defaultMaxWidth:fixWidth];
            
            CGFloat singleStackHeight = size.height;
            singleStackHeight += CONTENT_STRING_TOP_PADDING;//标题高
            singleStackHeight += CONTENT_STRING_BUTTOM_PADDING;//底部间距
            
            totalHeight += singleStackHeight;
        }];
        //totalHeight += STACK_BUTTOM_MARGIN;
    }

    return totalHeight;
}

+ (CGFloat)contentViewHeightWithString:(NSString*)contentStr StackWidth:(CGFloat)stackWidth TotalCount:(NSInteger)count{
    CGFloat height = CONTENT_STRING_TOP_PADDING;
    height += CONTENT_STRING_BUTTOM_PADDING;
    
    CGFloat fixWidth = stackWidth - LABEL_LEFT_PADDING - LABEL_RIGHT_PADDING;
    CGSize size = [contentStr resizablesWithFont:[UIFont systemFontOfSize:12] defaultMaxWidth:fixWidth];
    height += size.height;
    return height;
}

@end
