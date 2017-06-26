//
//  Created by yun on 16/5/9.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunDateHelper : NSObject

+ (instancetype)instance;

#pragma mark - form

+ (NSString *)getYmdForm;

+ (void)setYmdForm:(NSString *)ymd;

+ (NSString *)getYmdHmForm;

+ (void)setYmdHmForm:(NSString *)ymdHm;

#pragma mark - public funtions

#pragma mark - date

+ (NSDate *)dateByUnixInterval:(long long)interval;

+ (NSDate *)dateWithDateStr:(NSString *)dateStr andFormat:(NSString *)format;

+ (NSDate *)dateByYMDStr:(NSString *)ymd;

+ (NSDate *)getMonthBeginDay:(NSDate *)date;

+ (NSDate *)getMonthEndDay:(NSDate *)date;

+ (NSDate *)preDate:(NSDate *)date withDays:(NSInteger)days;

+ (NSDate *)nextDate:(NSDate *)date withDays:(NSInteger)days;

#pragma mark - unix Interval

+ (long long)unixIntervalNow;

+ (long long)unixIntervalByDate:(NSDate *)date;

+ (long long)unixIntervalByYMDStr:(NSString *)ymd;

+ (long long)unixIntervalByYMDHMStr:(NSString *)ymdHm;

#pragma mark - date verify

+ (BOOL)isToday:(NSDate *)date;

+ (BOOL)isSameDate:(NSDate *)date1 date2:(NSDate *)date2 byForm:(NSString *)form;

+ (BOOL)isSameDateByYMD:(NSDate *)date1 date2:(NSDate *)date2;

#pragma mark - date Str

+ (NSString *)dateStrWith:(NSDate *)date andFormat:(NSString *)format;

+ (NSString *)dateStrYMDWith:(NSDate *)ymd;

+ (NSString *)dateStrYMDHMWith:(NSDate *)ymdHm;

+ (NSString *)dateStrYMDWithUnix:(long long)ymd;

+ (NSString *)dateStrYMDHMWithUnix:(long long)ymdHm;

+ (NSString *)dateStrWithUnix:(long long)time format:(NSString *)format;

+ (NSString *)dateStrWithDate:(NSDate *)date format:(NSString *)format;

+ (NSString *)dateStrWithDate:(NSDate *)date format:(NSString *)format nullText:(NSString *)text;

+ (NSString *)weekdayNameWithDate:(NSString *)dateYmd;

+ (NSInteger)weekdayWithDate:(NSString *)dateYmd;

+ (NSInteger)weekNoByWeekDay:(NSInteger)weekDay;

+ (NSInteger)daysFromDate:(NSDate *)startDate toDate:(NSDate *)endDate;

+ (NSInteger)getNowWeekday;

+ (NSDateComponents *)getDateComponents:(NSDate *)date;

+ (NSInteger)weekNumForYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end
