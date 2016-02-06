#import "SOCIntUtils.h"


@implementation SOCIntUtils

+ (NSUInteger)intFromHexString:(NSString *)hexString {
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    unsigned int value = 0;
    [scanner scanHexInt:&value];
    return value;
}

+ (NSComparisonResult)compare:(NSInteger)first with:(NSInteger)second {
    if (first == NSNotFound && second == NSNotFound) {
        return NSOrderedSame;
    }

    if (first == NSNotFound) {
        return NSOrderedDescending;
    }

    if (second == NSNotFound) {
        return NSOrderedAscending;
    }

    if (first > second) {
        return NSOrderedDescending;
    } else {
        return NSOrderedAscending;
    }
}

+ (NSUInteger)randomIntBetween:(NSUInteger)from and:(NSUInteger)to {
    return arc4random_uniform(to) + from;
}

+ (NSUInteger)randomInt {
    return [self randomIntBetween:0 and:NSUIntegerMax];
}


@end