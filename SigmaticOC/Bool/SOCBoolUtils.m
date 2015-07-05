#import "SOCBoolUtils.h"
#import "SOCStringExtension.h"
#import "SOCBoolSet.h"


@implementation SOCBoolUtils

+ (BOOL)fromYesNo:(NSString *)yesNo {
    return [[SOCBoolSet yesNoSet] isTrue:yesNo];
}

+ (BOOL)fromYN:(NSString *)yN {
    return [[SOCBoolSet yNSet] isTrue:yN];
}

+ (BOOL)fromTrueFalse:(NSString *)trueFalse {
    return [[SOCBoolSet trueFalseSet] isTrue:trueFalse];
}

+ (BOOL)fromZeroOne:(NSString *)zeroOne {
    return [[SOCBoolSet zeroOneSet] isTrue:zeroOne];
}

@end