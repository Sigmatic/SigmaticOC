#import "SOCBoolSet.h"
#import "SOCStringExtension.h"

@implementation SOCBoolSet

+ (instancetype)newWithTrueString:(NSString *)trueString falseString:(NSString *)falseString {
    SOCBoolSet *boolSet = [[self alloc] init];
    [boolSet setTrueString:trueString];
    [boolSet setFalseString:falseString];
    return boolSet;
}

+ (instancetype)yesNoSet {
    return [self newWithTrueString:@"Yes" falseString:@"No"];
}

+ (instancetype)yNSet {
    return [self newWithTrueString:@"Y" falseString:@"N"];
}

+ (instancetype)trueFalseSet {
    return [self newWithTrueString:@"True" falseString:@"False"];
}

+ (instancetype)zeroOneSet {
    return [self newWithTrueString:@"1" falseString:@"0"];
}

- (BOOL)isTrue:(NSString *)string {
    return [self.trueString isEqualToStringIgnoreCase:string];
}

- (BOOL)isFalse:(NSString *)string {
    return [self.falseString isEqualToStringIgnoreCase:string];
}

@end