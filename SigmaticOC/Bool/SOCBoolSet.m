#import "SOCBoolSet.h"
#import "SOCStringExtension.h"

@implementation SOCBoolSet

#pragma mark - Instantiation

+ (instancetype)setWithTrueString:(NSString *)trueString falseString:(NSString *)falseString {
    SOCBoolSet *boolSet = [[self alloc] init];
    [boolSet setTrueString:trueString];
    [boolSet setFalseString:falseString];
    return boolSet;
}

+ (instancetype)yesNoSet {
    return [self setWithTrueString:@"Yes" falseString:@"No"];
}

+ (instancetype)yNSet {
    return [self setWithTrueString:@"Y" falseString:@"N"];
}

+ (instancetype)trueFalseSet {
    return [self setWithTrueString:@"True" falseString:@"False"];
}

+ (instancetype)oneZeroSet {
    return [self setWithTrueString:@"1" falseString:@"0"];
}

#pragma mark - Matching

- (BOOL)isTrue:(NSString *)string {
    return [self.trueString equalsIgnoreCase:string];
}

- (BOOL)isFalse:(NSString *)string {
    return [self.falseString equalsIgnoreCase:string];
}

- (NSString *)describe:(BOOL)truthBool {
    if (truthBool) {
        return self.trueString;
    }
    return self.falseString;
}

#pragma mark - Easy Access

+ (BOOL)bestGuess:(NSString *)ambiguous {
    for (SOCBoolSet *set in [self knownSets]) {
        if ([set isTrue:ambiguous]) {
            return YES;
        }
    }
    return NO;
}

+ (BOOL)fromYesNo:(NSString *)yesNo {
    return [[SOCBoolSet yesNoSet] isTrue:yesNo];
}

+ (BOOL)fromYN:(NSString *)yN {
    return [[SOCBoolSet yNSet] isTrue:yN];
}

+ (BOOL)fromTrueFalse:(NSString *)trueFalse {
    return [[SOCBoolSet trueFalseSet] isTrue:trueFalse];
}

+ (BOOL)fromOneZero:(NSString *)oneZero {
    return [[SOCBoolSet oneZeroSet] isTrue:oneZero];
}

+ (NSArray *)knownSets {
    return @[
            [SOCBoolSet yesNoSet],
            [SOCBoolSet trueFalseSet],
            [SOCBoolSet oneZeroSet],
            [SOCBoolSet yNSet]
    ];
}

@end