#import <Foundation/Foundation.h>

/**
 All Calendar Components (Month, Day, Week, Era, etc).
 */
extern const NSCalendarUnit ALL_CALENDAR_UNITS;

/**
 Number of seconds in a minute.
 */
extern const NSUInteger SECONDS_IN_MINUTE;

/**
 Number of seconds in an hour.
 */
extern const NSUInteger SECONDS_IN_HOUR;

/**
 Number of seconds in a day.
 */
extern const NSUInteger SECONDS_IN_DAY;

/**
 Number of seconds in a week.
 */
extern const NSUInteger SECONDS_IN_WEEK;

/**
 An estimate of the number of seconds in a year.
 */
extern const NSUInteger SECONDS_IN_YEAR_ESTIMATE;



/**
 The `SOCDateUtils` class provides utilities to create and compare dates.
 */
@interface SOCDateUtils : NSObject



///------------------------------------
/// @name Comparison
///------------------------------------

/**
 Check if a date is in the past.

 @param date The date to check.
 @return Whether the date is in the past.
 */
+ (BOOL)isPast:(NSDate *)date;

/**
 Check if a date is in the future.

 @param date The date to check.
 @return Whether the date is in the future.
 */
+ (BOOL)isFuture:(NSDate *)date;

/**
 Check if a date is before another date.

 @param date The date to check.
 @param otherDate The date to compare it to.
 @return Whether date is before otherDate.
 */
+ (BOOL)isDate:(NSDate *)date beforeDate:(NSDate *)otherDate;

/**
 Check if a date is after another date.

 @param date The date to check.
 @param otherDate The date to compare it to.
 @return Whether date is after otherDate.
 */
+ (BOOL)isDate:(NSDate *)date afterDate:(NSDate *)otherDate;

/**
 Check if a date is today.

 @param date The date to check.
 @return Whether date is today.
 */
+ (BOOL)isToday:(NSDate *)date;

/**
 Check if a date is today in a specific timezone.

 @param date The date to check.
 @param timeZone The timeZone to convert the date to.
 @return Whether date is today in that timezone.
 */
+ (BOOL)isToday:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone;

/**
 Check if a date is in the same day as another date.

 @param date The date to check.
 @param otherDate The date to compare it to.
 @return Whether the two dates are in the same day.
 */
+ (BOOL)isDayInSameDay:(NSDate *)date asDate:(NSDate *)otherDate;

/**
 Check if a date is in the same day as another date in a specific.

 @param date The date to check.
 @param otherDate The date to compare it to.
 @return Whether the two dates are in the same day.
 */
+ (BOOL)isDayInSameDay:(NSDate *)date asDate:(NSDate *)otherDate inTimeZone:(NSTimeZone *)timeZone;



///------------------------------------
/// @name Instantiation
///------------------------------------

/**
 Instantiate a new date with the start of the day of another date.

 @param date The date to strip the time from and get the start of the day.
 @return The new date instance.
 */
+ (NSDate *)startOfDay:(NSDate *)date;

/**
 Instantiate a new date with the start of the day of another date in a specific timezone.

 @param date The date to strip the time from and get the start of the day.
 @return The new date instance.
 */
+ (NSDate *)startOfDay:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone;

/**
 Instantiate a new date with the end of the day of another date.

 @param date The date to strip the time from and get the end of the day.
 @return The new date instance.
 */
+ (NSDate *)endOfDay:(NSDate *)date;


/**
 Instantiate a new date with the end of the day of another date in a specific timezone.

 @param date The date to strip the time from and get the end of the day.
 @return The new date instance.
 */
+ (NSDate *)endOfDay:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone;

@end