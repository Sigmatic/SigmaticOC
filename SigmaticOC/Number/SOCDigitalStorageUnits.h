#import <Foundation/Foundation.h>
#import "SOCNumberMultiples.h"

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

@interface SOCDigitalStorageUnits : NSObject

+ (double)convert:(double)amount from:(SOCStorageUnit)fromUnits to:(SOCStorageUnit)toUnits;

@end