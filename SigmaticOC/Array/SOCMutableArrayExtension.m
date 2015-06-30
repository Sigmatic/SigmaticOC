#import "SOCMutableArrayExtension.h"

@implementation NSMutableArray (SOCExtension)

- (void)safeAddObject:(id)object {
    if (!object) {
        return;
    }
    [self addObject:object];
}

- (void)addObjectIfNew:(id)object {
    if (![self containsObject:object]) {
        [self addObject:object];
    }
}

- (void)safeAddObjectIfNew:(id)object {
    if (![self containsObject:object]) {
        [self safeAddObject:object];
    }
}

@end