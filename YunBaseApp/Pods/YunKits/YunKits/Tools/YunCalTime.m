//
//  Created by yiliu on 16/4/13.
//  Copyright © 2016年 mushoom. All rights reserved.
//

#import "YunCalTime.h"

@implementation YunCalTime

/**
 *获取当前日期
 */
+ (NSDictionary *)calculationNowTime {
    NSString *format = @"YYYY-MM-dd HH:mm";
    NSDate *senddate = [NSDate date];

    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:format];
    NSString *time = [dateformatter stringFromDate:senddate];

    NSArray *ary = [time componentsSeparatedByString:@" "];
    NSArray *ary1 = [ary[0] componentsSeparatedByString:@"-"];
    NSArray *ary2 = [ary[1] componentsSeparatedByString:@":"];

    return @{
            @"year"  : ary1[0],
            @"month" : [NSString stringWithFormat:@"%tu", [ary1[1] integerValue]],
            @"day"   : [NSString stringWithFormat:@"%tu", [ary1[2] integerValue]],
            @"hh"    : [NSString stringWithFormat:@"%tu", [ary2[0] integerValue]],
            @"mm"    : ary2[1]
    };

}

/**
 *设置默认时间
 */
+ (NSDictionary *)calculationDefaultTime:(NSString *)defaultTime {
    NSString *format = @"YYYY-MM-dd HH:mm";

    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:format];
    NSDate *senddate = [dateformatter dateFromString:defaultTime];
    NSString *time = [dateformatter stringFromDate:senddate];

    NSArray *ary = [time componentsSeparatedByString:@" "];
    NSArray *ary1 = [ary[0] componentsSeparatedByString:@"-"];
    NSArray *ary2 = [ary[1] componentsSeparatedByString:@":"];

    return @{
            @"year"  : ary1[0],
            @"month" : [NSString stringWithFormat:@"%tu", [ary1[1] integerValue]],
            @"day"   : [NSString stringWithFormat:@"%tu", [ary1[2] integerValue]],
            @"hh"    : [NSString stringWithFormat:@"%tu", [ary2[0] integerValue]],
            @"mm"    : ary2[1]
    };

}

/**
 *获取年
 */
+ (NSArray *)calculationYear {
    NSMutableArray *list = [[NSMutableArray alloc] init];

    for (int i = 1900; i <= 3000; i++) {
        NSString *str = [NSString stringWithFormat:@"%tu", i];
        [list addObject:str];

    }

    return list;
}

/**
 *获取月
 */
+ (NSArray *)calculationMonth {
    return @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12"];
}

/**
 *根据年份和月份获取天数
 */
+ (NSArray *)calculationDay:(NSString *)year andMonth:(NSString *)month {
    NSInteger yearI = [year integerValue];
    NSInteger monthI = [month integerValue];

    if ((monthI == 1) ||
        (monthI == 3) ||
        (monthI == 5) ||
        (monthI == 7) ||
        (monthI == 8) ||
        (monthI == 10) ||
        (monthI == 12)) {
        return [self getDays:31];
    }

    if ((monthI == 4) || (monthI == 6) || (monthI == 9) || (monthI == 11)) {
        return [self getDays:30];
    }

    if ((yearI % 4 == 1) || (yearI % 4 == 2) || (yearI % 4 == 3)) {
        return [self getDays:28];
    }

    if (yearI % 400 == 0) {
        return [self getDays:29];
    }

    if (yearI % 100 == 0) {
        return [self getDays:28];
    }

    return [self getDays:29];
}

/**
 *获取时
 */
+ (NSArray *)calculationHH {
    return @[
            @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
            @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20",
            @"21", @"22", @"23", @"24"
    ];
}

/**
 *获取分
 */
+ (NSArray *)calculationMM {
    return @[
            @"00", @"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10",
            @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20",
            @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30",
            @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"38", @"39", @"40",
            @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50",
            @"51", @"52", @"53", @"54", @"55", @"56", @"57", @"58", @"59"
    ];
}

+ (NSArray *)getDays:(NSInteger)num {
    if (num == 28) {
        return @[
                @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20",
                @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28"
        ];
    }
    if (num == 29) {
        return @[
                @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20",
                @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29"
        ];
    }
    if (num == 30) {
        return @[
                @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20",
                @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30"
        ];
    }
    if (num == 31) {
        return @[
                @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20",
                @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31"
        ];
    }
    return nil;
}

/**
 *根据时间获取星期几
 */
+ (NSString *)ObtainWeek:(NSString *)day andMonth:(NSString *)month andYear:(NSString *)year {
    NSDateComponents *_comps = [[NSDateComponents alloc] init];

    NSInteger dayInter = [day integerValue];
    NSInteger monthInter = [month integerValue];
    NSInteger yearInter = [year integerValue];

    [_comps setDay:dayInter];
    [_comps setMonth:monthInter];
    [_comps setYear:yearInter];
    NSCalendar *gregorian = [[NSCalendar alloc]
                                         initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *_date = [gregorian dateFromComponents:_comps];
    NSDateComponents *weekdayComponents =
            [gregorian components:NSCalendarUnitWeekday fromDate:_date];
    NSInteger _weekday = [weekdayComponents weekday];

    NSString *weak;

    switch (_weekday) {
        case 1:
            weak = @"星期天";
            break;
        case 2:
            weak = @"星期一";
            break;
        case 3:
            weak = @"星期二";
            break;
        case 4:
            weak = @"星期三";
            break;
        case 5:
            weak = @"星期四";
            break;
        case 6:
            weak = @"星期五";
            break;
        case 7:
            weak = @"星期六";
            break;
        default:
            break;
    }

    return weak;
}

//把阳历转换成农历
+ (NSString *)getChineseCalendarWithDate:(NSString *)dateStr {
    NSArray *chineseYears = @[
            @"甲子", @"乙丑", @"丙寅", @"丁卯", @"戊辰", @"己巳", @"庚午", @"辛未", @"壬申", @"癸酉",
            @"甲戌", @"乙亥", @"丙子", @"丁丑", @"戊寅", @"己卯", @"庚辰", @"辛己", @"壬午", @"癸未",
            @"甲申", @"乙酉", @"丙戌", @"丁亥", @"戊子", @"己丑", @"庚寅", @"辛卯", @"壬辰", @"癸巳",
            @"甲午", @"乙未", @"丙申", @"丁酉", @"戊戌", @"己亥", @"庚子", @"辛丑", @"壬寅", @"癸丑",
            @"甲辰", @"乙巳", @"丙午", @"丁未", @"戊申", @"己酉", @"庚戌", @"辛亥", @"壬子", @"癸丑",
            @"甲寅", @"乙卯", @"丙辰", @"丁巳", @"戊午", @"己未", @"庚申", @"辛酉", @"壬戌", @"癸亥"
    ];

    NSArray *chineseMonths = @[
            @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
            @"九月", @"十月", @"冬月", @"腊月"
    ];

    NSArray *chineseDays = @[
            @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
            @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
            @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十"
    ];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    NSDate *date = [dateFormatter dateFromString:dateStr];

    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];

    NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;

    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];

    NSString *y_str = chineseYears[(NSUInteger) (localeComp.year - 1)];
    NSString *m_str = chineseMonths[(NSUInteger) (localeComp.month - 1)];
    NSString *d_str = chineseDays[(NSUInteger) (localeComp.day - 1)];

    return [NSString stringWithFormat:@"%@-%@-%@", y_str, m_str, d_str];
}

//把阳历转换成农历
+ (NSDictionary *)getChineseCalendarWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSArray *chineseYears = @[
            @"甲子", @"乙丑", @"丙寅", @"丁卯", @"戊辰", @"己巳", @"庚午", @"辛未", @"壬申", @"癸酉",
            @"甲戌", @"乙亥", @"丙子", @"丁丑", @"戊寅", @"己卯", @"庚辰", @"辛己", @"壬午", @"癸未",
            @"甲申", @"乙酉", @"丙戌", @"丁亥", @"戊子", @"己丑", @"庚寅", @"辛卯", @"壬辰", @"癸巳",
            @"甲午", @"乙未", @"丙申", @"丁酉", @"戊戌", @"己亥", @"庚子", @"辛丑", @"壬寅", @"癸丑",
            @"甲辰", @"乙巳", @"丙午", @"丁未", @"戊申", @"己酉", @"庚戌", @"辛亥", @"壬子", @"癸丑",
            @"甲寅", @"乙卯", @"丙辰", @"丁巳", @"戊午", @"己未", @"庚申", @"辛酉", @"壬戌", @"癸亥"
    ];

    NSArray *chineseMonths = @[
            @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
            @"九月", @"十月", @"冬月", @"腊月"
    ];

    NSArray *chineseDays = @[
            @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
            @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
            @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十"
    ];

    NSString *dateStr = [NSString stringWithFormat:@"%04ld-%02ld-%02ld", (long) year, (long) month, (long) day];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
//    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:dateStr];

    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];

    NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;

    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];

    NSString *y_str = chineseYears[(NSUInteger) (localeComp.year - 1)];
    NSString *m_str = chineseMonths[(NSUInteger) (localeComp.month - 1)];
    NSString *d_str = chineseDays[(NSUInteger) (localeComp.day - 1)];

    NSMutableDictionary *dateDic = [NSMutableDictionary new];
    dateDic[@"year"] = @(year);
    dateDic[@"month"] = @(month);
    dateDic[@"day"] = @(day);

    dateDic[@"yearStr"] = y_str;
    dateDic[@"monthStr"] = m_str;
    dateDic[@"dayStr"] = d_str;

    return dateDic;
}

/**
 *根据月份获取天数（有判断是否是周末）
 */
+ (NSArray *)calculationDay2:(NSString *)iyear andMonth:(NSString *)month {
    NSMutableArray *aryD = [[NSMutableArray alloc] initWithCapacity:0];
    NSArray *ary = [self calculationDay:iyear andMonth:month];
    for (int i = 1; i <= ary.count; i++) {
        NSString *week = [self ObtainWeek:ary[(NSUInteger) (i - 1)] andMonth:month andYear:iyear];
        NSString *day = [NSString stringWithFormat:@"%tu", i];
        if ([week isEqual:@"星期六"] || [week isEqual:@"星期天"]) {
            [aryD addObject:@{@"day" : day, @"isZM" : @"1"}];
        }
        else {
            [aryD addObject:@{@"day" : day, @"isZM" : @"0"}];
        }
    }
    return aryD;
}

@end
