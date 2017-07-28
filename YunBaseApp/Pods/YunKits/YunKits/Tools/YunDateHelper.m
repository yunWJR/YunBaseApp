//
//  Created by yun on 16/5/9.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunDateHelper.h"
#import "YunConfig.h"

@implementation YunDateHelper

+ (instancetype)instance {
    static YunDateHelper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [YunDateHelper new];
    });

    return instance;
}

#pragma mark - form

+ (NSString *)Ymd_Form {
    return YunConfig.instance.dateFmYmd;
}

+ (NSString *)YmdHm_Form {
    return YunConfig.instance.dateFmYmdHm;
}

#pragma mark - public funtions

#pragma mark - date

+ (NSDate *)dateByUnixInterval:(long long)interval {
    if (interval <= 0) {
        return nil;
    }

    return [NSDate dateWithTimeIntervalSince1970:(interval / 1000)];
}

+ (NSDate *)dateWithDateStr:(NSString *)dateStr andFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:dateStr];
    return date;
}

+ (NSDate *)dateByYMDStr:(NSString *)ymd {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:self.Ymd_Form];
    NSDate *date = [formatter dateFromString:ymd];
    return date;
}

+ (NSDate *)getMonthBeginDay:(NSDate *)date {
    double interval = 0;
    NSDate *beginDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];

    [calendar setFirstWeekday:2];//设定周一为周首日
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:date];
    //分别修改为 NSDayCalendarUnit NSWeekCalendarUnit NSYearCalendarUnit
    if (ok) {
        return beginDate;
    }
    else {
        return nil;
    }
}

+ (NSDate *)getMonthEndDay:(NSDate *)date {
    double interval = 0;
    NSDate *beginDate = nil;
    NSDate *endDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];

    [calendar setFirstWeekday:2];//设定周一为周首日
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:date];
    //分别修改为 NSDayCalendarUnit NSWeekCalendarUnit NSYearCalendarUnit
    if (ok) {
        endDate = [beginDate dateByAddingTimeInterval:interval - 1];

        return endDate;
    }
    else {
        return nil;
    }
}

+ (NSDate *)preDate:(NSDate *)date withDays:(NSInteger)days {
    return [NSDate dateWithTimeInterval:-24 * 60 * 60 * days sinceDate:date];
}

+ (NSDate *)nextDate:(NSDate *)date withDays:(NSInteger)days {
    return [NSDate dateWithTimeInterval:24 * 60 * 60 * days sinceDate:date];//后一天
}

#pragma mark - unix Interval

+ (long long)unixIntervalNow {
    return (long long) [[NSDate date] timeIntervalSince1970] * 1000;
}

+ (long long)unixIntervalByDate:(NSDate *)date {
    if (date == nil) {
        return 0;
    }

    return (long long) [date timeIntervalSince1970] * 1000;
}

+ (long long)unixIntervalByYMDStr:(NSString *)ymd {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:self.Ymd_Form];
    NSDate *date = [formatter dateFromString:ymd];
    if (date) {
        return [self unixIntervalByDate:date];
    }

    return -1;
}

+ (long long)unixIntervalByYMDHMStr:(NSString *)ymdHm {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:self.YmdHm_Form];
    NSDate *date = [formatter dateFromString:ymdHm];
    if (date) {
        return [self unixIntervalByDate:date];
    }

    return -1;
}

#pragma mark - date verify

+ (BOOL)isToday:(NSDate *)date {
    return [self isSameDateByYMD:date date2:[NSDate date]];
}

+ (BOOL)isSameDate:(NSDate *)date1 date2:(NSDate *)date2 byForm:(NSString *)form {
    NSString *date1Str = [self dateStrWith:date1 andFormat:form];
    NSString *date2Str = [self dateStrWith:date2 andFormat:form];

    return [date1Str isEqualToString:date2Str];
}

+ (BOOL)isSameDateByYMD:(NSDate *)date1 date2:(NSDate *)date2 {
    NSString *date1Str = [self dateStrWith:date1 andFormat:self.Ymd_Form];
    NSString *date2Str = [self dateStrWith:date2 andFormat:self.Ymd_Form];

    return [date1Str isEqualToString:date2Str];
}

#pragma mark - date Str

+ (NSString *)dateStrWith:(NSDate *)date andFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];

    return [formatter stringFromDate:date];
}

+ (NSString *)dateStrYMDWith:(NSDate *)ymd {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:self.Ymd_Form];

    return [formatter stringFromDate:ymd];
}

+ (NSString *)dateStrYMDHMWith:(NSDate *)ymdHm {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:self.YmdHm_Form];

    return [formatter stringFromDate:ymdHm];
}

+ (NSString *)dateStrYMDWithUnix:(long long)ymd {
    NSDate *cD = [YunDateHelper dateByUnixInterval:ymd];
    NSString *dateStr = [self dateStrYMDWith:cD];

    return dateStr;
}

+ (NSString *)dateStrYMDHMWithUnix:(long long)ymdHm {
    NSDate *cD = [YunDateHelper dateByUnixInterval:ymdHm];
    NSString *dateStr = [self dateStrYMDHMWith:cD];

    return dateStr;
}

+ (NSString *)dateStrWithUnix:(long long)time format:(NSString *)format {
    if (time <= 0) {
        return @"";
    }

    NSDate *date = [YunDateHelper dateByUnixInterval:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];

    return [formatter stringFromDate:date];
}

+ (NSString *)dateStrWithDate:(NSDate *)date format:(NSString *)format {
    return [self dateStrWithDate:date format:format nullText:@""];
}

+ (NSString *)dateStrWithDate:(NSDate *)date format:(NSString *)format nullText:(NSString *)text {
    if (date == nil) {
        return text;
    }

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];

    return [formatter stringFromDate:date];
}

+ (NSString *)weekdayNameWithDate:(NSString *)dateYmd {
    // 创建 格式 对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置 日期 格式 可以根据自己的需求 随时调整， 否则计算的结果可能为 nil
    formatter.dateFormat = self.Ymd_Form;
    // 将字符串日期 转换为 NSDate 类型
    NSDate *endDate = [formatter dateFromString:dateYmd];
    // 判断当前日期 和 未来某个时刻日期 相差的天数
    long days = [self daysFromDate:[NSDate date] toDate:endDate];
    // 将总天数 换算为 以 周 计算（假如 相差10天，其实就是等于 相差 1周零3天，只需要取3天，更加方便计算）
    long day = days >= 7 ? days % 7 : days;
    long week = [self getNowWeekday] + day;
    switch (week) {
        case 1:
            return @"周日";
        case 2:
            return @"周一";
        case 3:
            return @"周二";
        case 4:
            return @"周三";
        case 5:
            return @"周四";
        case 6:
            return @"周五";
        case 7:
            return @"周六";
        default:
            break;
    }

    return nil;
}

+ (NSInteger)weekdayWithDate:(NSString *)dateYmd {
    // 创建 格式 对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置 日期 格式 可以根据自己的需求 随时调整， 否则计算的结果可能为 nil
    [formatter setDateFormat:self.Ymd_Form];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];

    // 将字符串日期 转换为 NSDate 类型
    NSDate *endDate = [formatter dateFromString:dateYmd];
    NSDateComponents *components = [self getDateComponents:endDate];

    return [components weekday];
}

+ (NSInteger)weekNoByWeekDay:(NSInteger)weekDay {
    NSInteger weekNum = weekDay - 1;
    if (weekNum == 0) {
        weekNum = 7;
    }

    return weekNum;
}

+ (NSInteger)daysFromDate:(NSDate *)startDate toDate:(NSDate *)endDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 话说在真机上需要设置区域，才能正确获取本地日期，天朝代码:zh_CN
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //得到相差秒数
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    int days = ((int) time) / (3600 * 24);
    int hours = ((int) time) % (3600 * 24) / 3600;
    int minute = ((int) time) % (3600 * 24) / 3600 / 60;
    if (days <= 0 && hours <= 0 && minute <= 0) {
        NSLog(@"0天0小时0分钟");
        return 0;
    }
    else {
        NSLog(@"%@", [[NSString alloc] initWithFormat:@"%i天%i小时%i分钟", days, hours, minute]);
        // 之所以要 + 1，是因为 此处的days 计算的结果 不包含当天 和 最后一天\
         （如星期一 和 星期四，计算机 算的结果就是2天（星期二和星期三），日常算，星期一——星期四相差3天，所以需要+1）\
           对于时分 没有进行计算 可以忽略不计
        return days + 1;
    }
}

// 获取当前是星期几
+ (NSInteger)getNowWeekday {
//    NSDateComponents *comps = [[NSDateComponents alloc] init];

//    NSDate *now = [NSDate date];
    // 话说在真机上需要设置区域，才能正确获取本地日期，天朝代码:zh_CN
//    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
//    comps = [calendar components:unitFlags fromDate:now];
    return [[self getDateComponents:[NSDate date]] weekday];
}

+ (NSDateComponents *)getDateComponents:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"]];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
                          NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];

    return comps;
}

+ (NSInteger)weekNumForYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSInteger weekNUm = 0;

    NSInteger matchDay = 6; // 周五 1是周日 2是周一 6是周五

    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:self.Ymd_Form];
    NSDate
            *curDate =
            [dateFormatter dateFromString:[NSString stringWithFormat:@"%04ld-%02ld-%02ld",
                                                                     (long) year,
                                                                     (long) month,
                                                                     (long) day]];
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSRange daysRange = [currentCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:curDate];

    NSInteger days1 = daysRange.length;

    // first day
    NSInteger
            firstDay = [self weekdayWithDate:[NSString stringWithFormat:@"%04ld-%02ld-01", (long) year, (long) month]];

    weekNUm = (days1 - (matchDay - firstDay + 1)) / 7;
    if (matchDay >= firstDay) {
        weekNUm++;
    }

    return weekNUm;
}

+ (NSMutableDictionary *)weekIndexWithDate2:(NSDate *)date {
    NSMutableDictionary *rstDic = [NSMutableDictionary new];
    NSDateComponents *cmp = [self getDateComponents:date];
    NSInteger year = cmp.year;
    NSInteger month = cmp.month;
    NSInteger day = cmp.day;

    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:self.Ymd_Form];
    NSDate
            *firstDay =
            [dateFormatter dateFromString:[NSString stringWithFormat:@"%04ld-%02ld-01", (long) year, (long) month]];
    NSDateComponents *fCmp = [self getDateComponents:firstDay];
    NSInteger fDay = fCmp.day;

    NSInteger
            firstDayWeekDay =
            [self weekdayWithDate:[NSString stringWithFormat:@"%04ld-%02ld-01", (long) year, (long) month]];

    NSInteger weekCount = (day - fDay + firstDayWeekDay) / 7;
    NSInteger weekRemain = (day - fDay + firstDayWeekDay) % 7;

    NSInteger weekNum = [self weekNumForYear:year month:month day:day];

    if (weekCount == 0 && weekRemain == 1) { // 第一周,而且是周一,则是上月的最后一周
        NSInteger rstYear = year;
        NSInteger rstMonth = month;
        if (month == 1) {
            rstYear -= 1;
            rstMonth = 12;
        }

        NSInteger rstWeekNum = [self weekNumForYear:rstYear month:rstMonth day:15];

        [rstDic setObject:@(rstYear) forKey:@"year"];
        [rstDic setObject:@(rstMonth) forKey:@"month"];
        [rstDic setObject:@(rstWeekNum) forKey:@"week"];

        return rstDic;
    }

    if (weekCount == weekNum && weekRemain > 1) { // 最后一周,并且不在本月
        NSInteger rst2Year = year;
        NSInteger rst2Month = month;
        if (month == 12) {
            rst2Year += 1;
            rst2Month = 1;
        }

        NSInteger rst2WeekNum = 1;

        [rstDic setObject:@(rst2Year) forKey:@"year"];
        [rstDic setObject:@(rst2Month) forKey:@"month"];
        [rstDic setObject:@(rst2WeekNum) forKey:@"week"];

        return rstDic;
    }

    [rstDic setObject:@(year) forKey:@"year"];
    [rstDic setObject:@(month) forKey:@"month"];
    [rstDic setObject:@(weekCount + 1) forKey:@"week"];

    return rstDic;
}

+ (NSMutableDictionary *)weekIndexWithDate:(NSDate *)date {
    NSMutableDictionary *rstDic = [NSMutableDictionary new];
    NSDateComponents *cmp = [self getDateComponents:date];
    NSInteger year = cmp.year;
    NSInteger month = cmp.month;
    NSInteger day = cmp.day;

    NSInteger weekNum = [self weekNumForYear:year month:month day:day];

    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:self.Ymd_Form];

    date =
            [dateFormatter dateFromString:[NSString stringWithFormat:@"%04ld-%02ld-%02ld",
                                                                     (long) year,
                                                                     (long) month,
                                                                     (long) day]];
    NSDate
            *firstDay =
            [dateFormatter dateFromString:[NSString stringWithFormat:@"%04ld-%02ld-01", (long) year, (long) month]];
    NSInteger
            firstDayWeekDay =
            [self weekdayWithDate:[NSString stringWithFormat:@"%04ld-%02ld-01", (long) year, (long) month]];
    NSInteger firstDayWeekNo = [self weekNoByWeekDay:firstDayWeekDay];
    if (firstDayWeekNo == 7 || firstDayWeekNo == 6) { // 第一天是周六或者周日,则后延
        firstDay = [self nextDate:firstDay withDays:(8 - firstDayWeekNo)];
        firstDayWeekNo = 1;
    }

    for (int i = 0; i < weekNum; i++) {
        NSDate *pDay = [self preDate:firstDay withDays:(firstDayWeekNo - 1 - i * 7)];
        NSDate *nDat = [self nextDate:firstDay withDays:(7 - firstDayWeekNo + i * 7)];
        if (date.timeIntervalSince1970 < pDay.timeIntervalSince1970 && i == 0) { // 三月最后一天
            NSInteger rstYear = year;
            NSInteger rstMonth = month - 1;
            if (rstMonth == 0) {
                rstYear -= 1;
                rstMonth = 12;
            }

            NSInteger rstWeekNum = [self weekNumForYear:rstYear month:rstMonth day:15];

            [rstDic setObject:@(rstYear) forKey:@"year"];
            [rstDic setObject:@(rstMonth) forKey:@"month"];
            [rstDic setObject:@(rstWeekNum) forKey:@"week"];

            return rstDic;
        }
        else if (date.timeIntervalSince1970 >= pDay.timeIntervalSince1970 &&
                 date.timeIntervalSince1970 <= nDat.timeIntervalSince1970) { // 当前周
            [rstDic setObject:@(year) forKey:@"year"];
            [rstDic setObject:@(month) forKey:@"month"];
            [rstDic setObject:@(i + 1) forKey:@"week"];

            return rstDic;
        }
        else {
            continue;
        }
    }

    // 下月第一周
    NSInteger rst2Year = year;
    NSInteger rst2Month = month + 1;
    if (rst2Month == 13) {
        rst2Year += 1;
        rst2Month = 1;
    }

    NSInteger rst2WeekNum = 1;

    [rstDic setObject:@(rst2Year) forKey:@"year"];
    [rstDic setObject:@(rst2Month) forKey:@"month"];
    [rstDic setObject:@(rst2WeekNum) forKey:@"week"];

    return rstDic;
}

@end