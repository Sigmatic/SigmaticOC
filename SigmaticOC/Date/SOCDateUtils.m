#import "SOCDateUtils.h"

const NSCalendarUnit ALL_CALENDAR_UNITS = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |
        NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit |
        NSWeekdayOrdinalCalendarUnit);

const NSUInteger SECONDS_IN_MINUTE = 60;
const NSUInteger SECONDS_IN_HOUR = 3600;
const NSUInteger SECONDS_IN_DAY = 86400;
const NSUInteger SECONDS_IN_WEEK = 604800;
const NSUInteger SECONDS_IN_YEAR_ESTIMATE = 31556940;

@implementation SOCDateUtils

+ (BOOL)isPast:(NSDate *)date {
    return [self isDate:date beforeDate:[NSDate date]];
}

+ (BOOL)isFuture:(NSDate *)date {
    return [self isDate:date afterDate:[NSDate date]];
}

+ (BOOL)isDate:(NSDate *)date beforeDate:(NSDate *)otherDate {
    return [date compare:otherDate] == NSOrderedAscending;
}

+ (BOOL)isDate:(NSDate *)date afterDate:(NSDate *)otherDate {
    return [date compare:otherDate] == NSOrderedDescending;
}

+ (BOOL)isToday:(NSDate *)date {
    return [self isToday:date inTimeZone:[NSTimeZone localTimeZone]];
}

+ (BOOL)isToday:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone {
    return [self isDayInSameDay:date asDate:[NSDate date] inTimeZone:timeZone];
}

+ (BOOL)isDayInSameDay:(NSDate *)date asDate:(NSDate *)otherDate {
    return [self isDayInSameDay:date asDate:otherDate inTimeZone:[NSTimeZone localTimeZone]];
}

+ (BOOL)isDayInSameDay:(NSDate *)date asDate:(NSDate *)otherDate inTimeZone:(NSTimeZone *)timeZone {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    NSCalendarUnit calendarUnits = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:calendarUnits fromDate:date];
    components.timeZone = timeZone;
    NSDateComponents *dateComponents = [calendar components:calendarUnits fromDate:otherDate];
    dateComponents.timeZone = timeZone;
    if (components.year != dateComponents.year) {
        return NO;
    }
    if (components.month != dateComponents.month) {
        return NO;
    }
    return components.day == dateComponents.day;
}

+ (NSDate *)startOfDay:(NSDate *)date {
    return [self startOfDay:date inTimeZone:[NSTimeZone localTimeZone]];
}

+ (NSDate *)startOfDay:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    NSDateComponents *components = [calendar components:ALL_CALENDAR_UNITS fromDate:date];
    components.timeZone = timeZone;
    components.hour = components.minute = components.second = 0;
    NSDate *startDate = [calendar dateFromComponents:components];
    return startDate;
}

+ (NSDate *)endOfDay:(NSDate *)date {
    return [self endOfDay:date inTimeZone:[NSTimeZone localTimeZone]];
}

+ (NSDate *)endOfDay:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    NSDateComponents *components = [calendar components:ALL_CALENDAR_UNITS fromDate:date];
    components.timeZone = timeZone;
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    NSDate *endDate = [calendar dateFromComponents:components];
    return endDate;
}

@end