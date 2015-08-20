#import "SOCMutableArrayExtension.h"
#import "SOCArrayExtension.h"

@implementation NSMutableArray (SOCExtension)

- (void)removeObjectsWithClass:(Class)aClass {
    NSArray *objectsToRemove = [self objectsWithClass:aClass];
    [self removeObjectsInArray:objectsToRemove];
}

- (void)removeObjectsNotWithClass:(Class)aClass {
    NSArray *objectsToRemove = [self objectsNotWithClass:aClass];
    [self removeObjectsInArray:objectsToRemove];
}

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