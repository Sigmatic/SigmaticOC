#import "SOCArrayJSON.h"
#import "SOCJSONUtils.h"


@implementation NSArray (SOCJSON)

+ (instancetype)fromJSONString:(NSString *)json {
    return [SOCJSONUtils jsonToObject:json options:[self jsonOptionForMutability]];
}

+ (instancetype)safeFromJSONString:(NSString *)json {
    @try {
        return [SOCJSONUtils jsonToObject:json options:[self jsonOptionForMutability]];
    } @catch (NSException *exception) {
        return nil;
    }
}

- (NSString *)toJSONString {
    return [SOCJSONUtils objectToJSONString:self];
}

- (NSString *)safeToJSONString {
    @try {
        return [SOCJSONUtils objectToJSONString:self];
    } @catch (NSException *exception) {
        return nil;
    }
}

+ (NSJSONReadingOptions)jsonOptionForMutability {
    if ([self isMutable]) {
        return NSJSONReadingMutableContainers;
    }
    return (NSJSONReadingOptions) kNilOptions;
}

+ (BOOL)isMutable {
    return [[self class] isKindOfClass:[NSMutableArray class]];
}

@end