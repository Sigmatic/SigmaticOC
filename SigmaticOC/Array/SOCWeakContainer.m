#import "SOCWeakContainer.h"


@implementation SOCWeakContainer

+ (instancetype)containerWithObject:(id)object {
    SOCWeakContainer *container = [self new];
    [container setObject:object];
    return container;
}

- (BOOL)isEqual:(id)other {
    if (other == self) {
        return YES;
    }
    if (!other || ![[other class] isEqual:[self class]]) {
        return NO;
    }
    SOCWeakContainer *otherContainer = other;
    return [self.object isEqual:otherContainer.object];
}


@end