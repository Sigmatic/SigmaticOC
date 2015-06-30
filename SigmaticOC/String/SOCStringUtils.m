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
        if ([aString length] == 0) {
            return YES;
        }
    }
    return NO;
}



@end