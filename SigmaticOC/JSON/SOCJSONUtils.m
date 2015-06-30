#import "SOCJSONUtils.h"


@implementation SOCJSONUtils

+ (NSString *)objectToJSONString:(id)object {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:0
                                                         error:&error];
    if (error) {
        NSException *e = [NSException
                exceptionWithName:@"SOCInvalidJSONData"
                           reason:error.localizedDescription
                         userInfo:error.userInfo];
        @throw e;
    }
    if (jsonData) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return @"";
}

+ (id)jsonToObject:(NSString *)json {
    return [self jsonToObject:json options:(NSJSONReadingOptions) kNilOptions];
}

+ (id)jsonToObject:(NSString *)json options:(NSJSONReadingOptions)options {
    NSError *error;
    NSData *objectData = [json dataUsingEncoding:NSUTF8StringEncoding];
    id object = [NSJSONSerialization JSONObjectWithData:objectData
                                           options:options
                                             error:&error];
    if (error) {
        NSException *e = [NSException
                exceptionWithName:@"SOCInvalidJSONData"
                           reason:error.localizedDescription
                         userInfo:error.userInfo];
        @throw e;
    }
    return object;
}


@end