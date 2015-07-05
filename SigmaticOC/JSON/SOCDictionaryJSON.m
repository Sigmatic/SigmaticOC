#import "SOCDictionaryJSON.h"
#import "SOCJSONUtils.h"


@implementation NSDictionary (SOCJSON)

+ (instancetype)fromJSON:(NSString *)json {
    id hopefullyDictionary = [SOCJSONUtils jsonToObject:json options:[self jsonOptionForMutability]];
    if (![hopefullyDictionary isKindOfClass:[NSDictionary class]]) {
        NSString *reason = [NSString stringWithFormat:@"Requested data of type %@, but was %@",
                        NSStringFromClass([self class]), NSStringFromClass([hopefullyDictionary class])];
        NSException *e = [NSException exceptionWithName:@"SOCWrongJSONDataType" reason:reason userInfo:nil];
        @throw e;
    }
    return hopefullyDictionary;
}

+ (instancetype)safeFromJSON:(NSString *)json {
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
    return [[self class] isKindOfClass:[NSMutableDictionary class]];
}

@end