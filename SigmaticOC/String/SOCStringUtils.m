#import "SOCStringUtils.h"
#import "SOCStringExtension.h"


@implementation SOCStringUtils

+ (BOOL)isBlank:(NSString *)aString {
    if ([[NSNull null] isEqual:aString]) {
        return YES;
    }

    if (aString == nil) {
        return YES;
    } else if ([aString length] == 0) {
        return YES;
    } else {
        NSString *trimmed = [aString trim];
        if ([trimmed length] == 0) {
            return YES;
        }
    }
    return NO;
}

+ (BOOL)isNotBlank:(NSString *)aString {
    return ![self isBlank:aString];
}

+ (BOOL)string:(NSString *)first equals:(NSString *)second {
    if (first == nil && second == nil) {
        return YES;
    }
    return [first isEqualToString:second];
}


@end