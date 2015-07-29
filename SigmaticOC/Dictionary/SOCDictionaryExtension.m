#import "SOCDictionaryExtension.h"


@implementation NSDictionary (SOCExtension)

- (BOOL)isMutable {
    return [[self class] isKindOfClass:[NSMutableDictionary class]];
}

@end