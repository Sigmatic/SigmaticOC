#import "SOCArrayJSON.h"
#import "SOCJSONUtils.h"


@implementation NSArray (SOCJSON)

+ (instancetype)fromJSON:(NSString *)json {
    //TODO: check that the result is actually an array!
    return [SOCJSONUtils jsonToObject:json options:[self jsonOptionForMutability]];
}

+ (instancetype)safeFromJSON:(NSString *)json {
    //TODO: check that the result is actually an array!
    @try {
        return [SOCJSONUtils jsonToObject:json options:[self jsonOptionForMutability]];
    } @catch (NSException *exception) {
        return nil;
    }
}

- (NSString *)toJSON {
    return [SOCJSONUtils objectToJSON:self];
}

- (NSString *)safeToJSON {
    @try {
        return [SOCJSONUtils objectToJSON:self];
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