#import <Foundation/Foundation.h>

/**
 The `SOCIntUtils` class provides utilities for primitive integers.
 */
@interface SOCIntUtils : NSObject



///------------------------------------
/// @name Conversion
///------------------------------------

/**
 Convert a hex string to an int.

 @param hexString The hex string to convert.
 @return The integer of the same value.
 */
+ (NSUInteger)intFromHexString:(NSString *)hexString;



///------------------------------------
/// @name Compare
///------------------------------------

/**
 Compare two integers.

 @param first The first int to compare.
 @param second The int to compare it ito.
 @return The result of the comparison.
 */
+ (NSComparisonResult)compare:(NSInteger)first with:(NSInteger)second;



///------------------------------------
/// @name Compare
///------------------------------------

/**
 Get a random integer between two integers.

 @param from The beginning of the random int range.
 @param to The end of the random int range.
 @return The random integer.
 */
+ (NSUInteger)randomIntBetween:(NSUInteger)from and:(NSUInteger)to;

/**
 Get a random integer between 0 and NSUIntegerMax.

 @return The random integer.
 */
+ (NSUInteger)randomInt;

@end