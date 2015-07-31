#import <Foundation/Foundation.h>

extern const NSCalendarUnit ALL_CALENDAR_UNITS;
extern const NSUInteger SECONDS_IN_MINUTE;
extern const NSUInteger SECONDS_IN_HOUR;
extern const NSUInteger SECONDS_IN_DAY;
extern const NSUInteger SECONDS_IN_WEEK;
extern const NSUInteger SECONDS_IN_YEAR;

@interface SOCDateUtils : NSObject

+ (BOOL)isPast:(NSDate *)date;

+ (BOOL)isFuture:(NSDate *)date;

+ (BOOL)isDate:(NSDate *)date beforeDate:(NSDate *)otherDate;

+ (BOOL)isDate:(NSDate *)date afterDate:(NSDate *)otherDate;

+ (BOOL)isToday:(NSDate *)date;

+ (BOOL)isToday:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone;

+ (NSDate *)startOfDay:(NSDate *)date;

+ (NSDate *)startOfDay:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone;

+ (NSDate *)endOfDay:(NSDate *)date;

+ (NSDate *)endOfDay:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone;

+ (BOOL)isDayInSameDay:(NSDate *)date asDate:(NSDate *)otherDate;

+ (BOOL)isDayInSameDay:(NSDate *)date asDate:(NSDate *)otherDate inTimeZone:(NSTimeZone *)timeZone;

+ (NSDate *)dateWithoutTime:(NSDate *)date;

@end