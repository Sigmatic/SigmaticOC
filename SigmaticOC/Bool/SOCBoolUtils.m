#import "SOCBoolUtils.h"
#import "SOCStringExtension.h"


@implementation SOCBoolUtils

+ (BOOL)fromYesNo:(NSString *)yesNo {
    return [@"Yes" isEqualToStringIgnoreCase:yesNo];
}

+ (BOOL)fromYN:(NSString *)yN {
    return [@"Y" isEqualToStringIgnoreCase:yN];
}

+ (BOOL)fromTrueFalse:(NSString *)trueFalse {
    return [@"True" isEqualToStringIgnoreCase:trueFalse];
}

+ (BOOL)fromZeroOne:(NSString *)zeroOne {
    return [@"1" isEqualToStringIgnoreCase:zeroOne];
}

@end