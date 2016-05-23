//
//  NSString+Additions.h
//  JackFastKit
//
//  Created by kingsoft_ios on 14/12/25.
//  Copyright (c) 2014年 华捷 iOS软件开发工程师 曾宪华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Additions)

#pragma mark - ControlThousandCount
/**
 *  转换数量过多的文字为字符串
 *
 *  @param count 目标数量
 *
 *  @return 返回处理过的字符串字符串
 */
+ (NSString *)controlThousandCountWithCount:(NSInteger)count;


#pragma mark - DateConvert
+ (NSString *)formattedTimestampStringFromDate:(NSDate *)date;

/**
 *  日期转换
 *
 *  @param date NSDate类型
 *
 *  @return 返回字符串
 */
- (NSString *)stringWithDate:(NSDate *)date;

/**
 *  获取当前的时间轴字符串
 *
 *  @return 返回转换后时间轴的字符串
 */
+ (NSString *)currentTimeStamp;


#pragma mark - DeviceInfo
/**
 *  获取设备型号:iphone 5S
 *
 *  @return 返回设备型号字符串
 */
+ (NSString *)deviceName;

/**
 *  获取手机厂商
 *
 *  @return 返回手机厂商字符串
 */
+ (NSString *)phoneVersion;

/**
 *  获取客户端版本号
 *
 *  @return 返回客户端版本号字符串
 */
+ (NSString *)appCurrentVersion;

+ (NSString *)appBulidVersion;

/**
 *  获取系统设置是否打开通知
 *
 *  @return 返回系统设置的开关是否打开
 */
+ (BOOL)isRemotePushEnabled;


#pragma mark - DiskSizeTransfrom
/**
 *  把磁盘缓存大小换位Kb、Mb、Gb来表示
 *
 *  @param value 目标的磁盘缓存大小
 *
 *  @return 返回转换后的字符串
 */
+ (NSString *)transformedValue:(long long)value;


#pragma mark - FilePath
/**
 *  在Document目录下新建一个目标文件夹名的文件夹（这里没有做FileManamer的工作，请自行操作）
 *
 *  @param folder 目标文件夹名
 *
 *  @return 返回相应的路径地址
 */
+ (NSString *)getNewFilePathStringWithFolder:(NSString *)folder;


#pragma mark - Resizables
/**
 *  根据默认size来重新调整字符串的占位大小
 *
 *  @param font 目标字体
 *  @param size 目标默认最大Size
 *
 *  @return 返回计算调整后的大小
 */
- (CGSize)resizablesWithFont:(UIFont *)font defaultMaxSize:(CGSize)size;

/**
 *  根据默认高度来重新调整字符串的占位大小
 *
 *  @param font   目标字体
 *  @param height 目标默认最大height
 *
 *  @return 返回计算调整后的大小
 */
- (CGSize)resizablesWithFont:(UIFont *)font defaultMaxHeight:(CGFloat)height;

/**
 *  根据默认宽度来重新调整字符串的占位大小
 *
 *  @param font  目标字体
 *  @param width 目标默认最大width
 *
 *  @return 返回计算调整后的大小
 */
- (CGSize)resizablesWithFont:(UIFont *)font defaultMaxWidth:(CGFloat)width;

- (CGSize)resizablesWithAttributes:(NSDictionary *)attri defaultMaxWidth:(CGFloat)width;

#pragma mark - Timeline
/**
 *  把时间轴的字符串转为文字描述的时间轴
 *
 *  @return 返回把自己转换为文字时间轴的字符串
 */
- (NSString *)convertDateToTimeStringWithTimeStamp;


#pragma mark - Validate
/**
 *  判断目标文本是否为合法的电话号码
 *
 *  @param mobileNum 目标文本
 *
 *  @return 返回预期的结果（是或者不是）
 */
+ (BOOL)validateMobile:(NSString *)mobileNum;

/**
 *  Check if self is an email
 *
 *  @return Return YES if it's an email, NO if not
 */
- (BOOL)isEmail;

/**
 *  Check if the given string is an email
 *
 *  @param email The string to be checked
 *
 *  @return Return YES if it's an email, NO if not
 */
+ (BOOL)isEmail:(NSString *)email;

#pragma mark - MD5String
/**
 *  MD5 hash of the file on the filesystem specified by path
 *
 *  @param path file path
 *
 *  @return MD5 file name path
 */
+ (NSString *)stringWithMD5OfFile:(NSString *)path;

/**
 *  The string's MD5 hash
 *
 *  @return MD% string
 */
- (NSString *)MD5Hash;


#pragma mark - Base64
+ (NSString *)stringFromBase64String:(NSString *)base64String;

- (NSString *)base64String;

#pragma mark - 字数分割

+ (NSArray *)separateString:(NSString *)string;

+ (NSString *)getUniqueFileName;

@end
