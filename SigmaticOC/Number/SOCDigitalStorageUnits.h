#import <Foundation/Foundation.h>
#import "SOCNumberMultiples.h"

/**
 The different digital storage types.
 */
typedef NS_ENUM(NSUInteger, SOCStorageUnit) {
    SOCStorageUnitBytes = SOCMultiplesBase,
    SOCStorageUnitKiloBytes = SOCMultipleKilo,
    SOCStorageUnitMegaBytes = SOCMultipleMega,
    SOCStorageUnitGigaBytes = SOCMultipleGiga,
    SOCStorageUnitTeraBytes = SOCMultipleTera,
    SOCStorageUnitPetaBytes = SOCMultiplePeta,
    SOCStorageUnitExaBytes = SOCMultipleExa,
    SOCStorageUnitZettaBytes = SOCMultipleZetta,
    SOCStorageUnitYottaBytes = SOCMultipleYotta
};

/**
 The `SOCDigitalStorageUnits` class provides easy conversion between digital storage amounts.
 */
@interface SOCDigitalStorageUnits : NSObject



///------------------------------------
/// @name Conversion
///------------------------------------

/**
 Convert an amount of a type to another.

 @param amount The original amount.
 @param fromUnits The unit type of the original amount.
 @param toUnits The unit type of the desired amount.
 @return The amount after conversion.
 */
+ (double)convert:(double)amount from:(SOCStorageUnit)fromUnits to:(SOCStorageUnit)toUnits;

/**
 Convert an amount of bytes to human readable string.

 @param byteCount The amount of bytes to convert to human readable text.
 @return The human readable string.
 */
+ (NSString *)humanReadableBytes:(long long)byteCount;

/**
 Convert a unit type to its digital storage equivalent.
 Example: SOCStorageUnitGigaBytes (Giga bytes) is GB.

 @param unit The unit type to get a string representation for.
 @return The human readable string.
 */
+ (NSString *)descriptionForUnit:(SOCStorageUnit)unit;

@end