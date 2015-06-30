#import "SOCMutableArrayExtension.h"

@implementation NSMutableArray(SOCExtension)

- (void)safeAddObject:(id)object {
    if (!object) {
        return;
    }
    [self addObject:object];
}

@end