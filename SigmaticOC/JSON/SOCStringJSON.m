#import "SOCStringJSON.h"
#import "SOCJSONUtils.h"


@implementation NSString (SOCJSON)

- (id)toJSONObject {
    return [SOCJSONUtils jsonToObject:self];
}

- (id)safeToJSONObject {
    @try {
        return [SOCJSONUtils jsonToObject:self];
    } @catch (NSException *exception) {
        return nil;
    }
}

@end