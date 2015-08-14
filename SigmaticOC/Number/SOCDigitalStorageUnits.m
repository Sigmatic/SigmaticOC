#import "SOCDigitalStorageUnits.h"


@implementation SOCDigitalStorageUnits

+ (double)convert:(double)amount from:(SOCStorageUnit)fromUnits to:(SOCStorageUnit)toUnits {
    return [SOCNumberMultiples binaryConvert:amount from:(SOCNumberMultiple) fromUnits to:(SOCNumberMultiple) toUnits];
}

+ (NSString *)descriptionForUnit:(SOCStorageUnit)unit {
    switch (unit) {
        case SOCStorageUnitBytes:
            return @"Bytes";
        case SOCStorageUnitKiloBytes:
            return @"KB";
        case SOCStorageUnitMegaBytes:
            return @"MB";
        case SOCStorageUnitGigaBytes:
            return @"GB";
        case SOCStorageUnitTeraBytes:
            return @"TB";
        case SOCStorageUnitPetaBytes:
            return @"PB";
        case SOCStorageUnitExaBytes:
            return @"EB";
        case SOCStorageUnitZettaBytes:
            return @"ZB";
        case SOCStorageUnitYottaBytes:
            return @"YB";
        default:
            return @"Bytes";
    }
}


@end