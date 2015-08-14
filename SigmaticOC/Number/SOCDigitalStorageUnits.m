#import "SOCDigitalStorageUnits.h"


@implementation SOCDigitalStorageUnits

+ (double)convert:(double)amount from:(SOCStorageUnit)fromUnits to:(SOCStorageUnit)toUnits {
    return [SOCNumberMultiples binaryConvert:amount from:(SOCNumberMultiple) fromUnits to:(SOCNumberMultiple) toUnits];
}

@end