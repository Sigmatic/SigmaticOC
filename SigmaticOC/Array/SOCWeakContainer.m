#import "SOCWeakContainer.h"


@implementation SOCWeakContainer

#pragma mark - Instantiation

+ (instancetype)containerWithObject:(id)object {
    SOCWeakContainer *container = [self new];
    [container setObject:object];
    return container;
}

#pragma mark - Equality Check

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