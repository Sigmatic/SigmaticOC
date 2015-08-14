#import "SOCNumberMultiples.h"


@implementation SOCNumberMultiples

+ (double)binaryConvert:(double)amount from:(SOCNumberMultiple)fromType to:(SOCNumberMultiple)toType {
    return [self convert:amount from:fromType to:toType usingMultiplier:BINARY_MULTIPLIER];
}

+ (double)decimalConvert:(double)amount from:(SOCNumberMultiple)fromType to:(SOCNumberMultiple)toType {
    return [self convert:amount from:fromType to:toType usingMultiplier:DECIMAL_MULTIPLIER];
}

+ (double)convert:(double)amount from:(SOCNumberMultiple)fromType to:(SOCNumberMultiple)toType usingMultiplier:(NSUInteger)multiplier {
    NSInteger difference = toType - fromType;
    if (difference == 0) {
        return amount;
    }
    if (difference > 0) {
        return amount / (difference * multiplier);
    } else {
        return amount * (abs(difference) * multiplier);
    }
}

@end