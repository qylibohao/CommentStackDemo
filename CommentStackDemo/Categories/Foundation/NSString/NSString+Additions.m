//
//  NSString+Additions.m
//  JackFastKit
//
//  Created by kingsoft_ios on 14/12/25.
//  Copyright (c) 2014年 华捷 iOS软件开发工程师 曾宪华. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>

#import "NSString+Additions.h"



@implementation NSString (Additions)

#pragma mark - Resizables
- (CGSize)resizablesWithFont:(UIFont *)font defaultMaxSize:(CGSize)size {
    CGSize stringSize = [self resizablesStringWithFont:font defaultMaxSize:size];
    return stringSize;
}

- (CGSize)resizablesWithFont:(UIFont *)font defaultMaxHeight:(CGFloat)height {
    CGSize constraint = CGSizeMake(MAXFLOAT , height);
    CGSize stringSize = [self resizablesStringWithFont:font defaultMaxSize:constraint];
    stringSize.height = height;
    return stringSize;
}

- (CGSize)resizablesWithFont:(UIFont *)font defaultMaxWidth:(CGFloat)width {
    CGSize constraint = CGSizeMake(width , MAXFLOAT);
    CGSize stringSize = [self resizablesStringWithFont:font defaultMaxSize:constraint];
    if (!self.length) {
        stringSize.height = 0;
    }
    if (stringSize.width > width) {
        stringSize.width = width;
    }
    return stringSize;
}

- (CGSize)resizablesWithAttributes:(NSDictionary *)attri defaultMaxWidth:(CGFloat)width {
    CGSize constraint = CGSizeMake(width , MAXFLOAT);
    CGSize stringSize = [self resizablesStringWithAttributes:attri defaultMaxSize:constraint ];
    if (!self.length) {
        stringSize.height = 0;
    }
    if (stringSize.width > width) {
        stringSize.width = width;
    }
    return stringSize;
}

- (CGSize)resizablesStringWithFont:(UIFont *)font defaultMaxSize:(CGSize)defaultSize {
    CGSize stringSize;
    // code here for iOS 7.0
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize boundingBox = [self boundingRectWithSize:defaultSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
    stringSize = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    return stringSize;
}

- (CGSize)resizablesStringWithAttributes:(NSDictionary *)attri defaultMaxSize:(CGSize)defaultSize {
    CGSize stringSize;
    //ios7方法，获取文本需要的size，限制宽度
    CGSize boundingBox = [self boundingRectWithSize:defaultSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attri context:nil].size;
    
    stringSize = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    return stringSize;
}

#pragma mark - Timeline
#pragma mark - 日期转换 时间戳转换成nsdate
- (NSString *)convertDateToTimeStringWithTimeStamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self integerValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [[formatter stringFromDate:date] stringWithDate:date];
}


#pragma mark - Validate
+ (BOOL)validateMobile:(NSString *)mobileNum {
    NSString *regex = @"^0?(13[0-9]|15[012356789]|18[0-9]|14[57]|17[012356789])[0-9]{8}$";
    
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:mobileNum];
}

- (BOOL)isEmail {
    return [[self class] isEmail:self];
}

+ (BOOL)isEmail:(NSString *)email {
    NSString *emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:[email lowercaseString]];
}

#pragma mark - MD5String
+ (NSString *)stringWithMD5OfFile: (NSString *) path {
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath: path];
    if (handle == nil) {
        return nil;
    }
    
    CC_MD5_CTX md5;
    CC_MD5_Init (&md5);
    
    BOOL done = NO;
    
    while (!done) {
        
        NSData *fileData = [[NSData alloc] initWithData: [handle readDataOfLength: 4096]];
        CC_MD5_Update(&md5, [fileData bytes], (CC_LONG)[fileData length]);
        
        if ([fileData length] == 0) {
            done = YES;
        }
        
    }
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final (digest, &md5);
    NSString *s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0],  digest[1],
                   digest[2],  digest[3],
                   digest[4],  digest[5],
                   digest[6],  digest[7],
                   digest[8],  digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    
    return s;
    
}

- (NSString *)MD5Hash {
    CC_MD5_CTX md5;
    CC_MD5_Init (&md5);
    CC_MD5_Update (&md5, [self UTF8String], (CC_LONG)[self length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final (digest, &md5);
    NSString *s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0],  digest[1],
                   digest[2],  digest[3],
                   digest[4],  digest[5],
                   digest[6],  digest[7],
                   digest[8],  digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    
    return s;
}




#pragma mark - 字数分割

+ (NSArray *)separateString:(NSString *)string {
    NSInteger number = [string integerValue];
    NSAssert(number, @"提示你最好字符串内全部都是数字，当然，如果一定，也是可以分割的，是你想要的吗？");
    NSMutableArray *separates = [NSMutableArray array];
    for (int i = 0; i < [string length]; ++i) {
        [separates addObject:[NSString stringWithFormat:@"%c", [string characterAtIndex:i]]];
    }
    
    return separates;
}

+ (NSString *)getUniqueFileName {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    
    CFRelease(uuidRef);
    
    NSString *uniqueString = (__bridge NSString *)uuidStringRef;
    uniqueString = [NSString stringWithFormat:@"%@", uniqueString];
    CFRelease(uuidStringRef);
    return uniqueString;
}


@end
