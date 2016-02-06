#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SOCNumberMultiple) {
    SOCMultiplesBase = 1,
    SOCMultipleKilo = 2,
    SOCMultipleMega = 3,
    SOCMultipleGiga = 4,
    SOCMultipleTera = 5,
    SOCMultiplePeta = 6,
    SOCMultipleExa = 7,
    SOCMultipleZetta = 8,
    SOCMultipleYotta = 9
};

/**
 The decimal multiplier uses 1000 when stepping to the next multiplier unit
 */
static const NSUInteger DECIMAL_MULTIPLIER = 1000;

/**
 The binary multiplier uses 1024 instead of 1000 when stepping to the next multiplier unit
 */
static const NSUInteger BINARY_MULTIPLIER = 1024;

/**
 The `SOCNumberMultiples` class provides easy numbers multiplication between different units.
 */
@interface SOCNumberMultiples : NSObject



///------------------------------------
/// @name Multiply
///------------------------------------

/**
 Multiply an amount from a unit type to a unit type using decimal conversion.

 @param amount The amount to convert.
 @param fromType The type the amount is in.
 @param toType The type desired as output.
 @return The value after conversion.
 */
+ (double)binaryConvert:(double)amount from:(SOCNumberMultiple)fromType to:(SOCNumberMultiple)toType;

/**
 Multiply an amount from a unit type to a unit type using digital conversion.

 @param amount The amount to convert.
 @param fromType The type the amount is in.
 @param toType The type desired as output.
 @return The value after conversion.
 */
+ (double)decimalConvert:(double)amount from:(SOCNumberMultiple)fromType to:(SOCNumberMultiple)toType;

@end