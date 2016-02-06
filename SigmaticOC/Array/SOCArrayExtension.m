#import "SOCArrayExtension.h"
#import "SOCIntUtils.h"
#import "SOCMutableArrayExtension.h"


@implementation NSArray (SOCExtension)

#pragma mark - Properties

- (BOOL)isMutable {
    return [[self class] isKindOfClass:[NSMutableArray class]];
}

#pragma mark - Filtering

- (instancetype)objectsWithClass:(Class)aClass {
    NSMutableArray *results = [NSMutableArray new];
    for (id object in self) {
        if ([object isKindOfClass:aClass]) {
            [results addObject:object];
        }
    }
    return [self.class arrayWithArray:results];
}

- (instancetype)objectsNotWithClass:(Class)aClass {
    NSMutableArray *results = [NSMutableArray new];
    for (id object in self) {
        if (![object isKindOfClass:aClass]) {
            [results addObject:object];
        }
    }
    return [self.class arrayWithArray:results];
}

- (instancetype)uniqueObjects {
    NSMutableArray *uniqueItems = [[NSMutableArray alloc] init];
    for (id item in self) {
        [uniqueItems addObjectIfNew:item];
    }
    return [self.class arrayWithArray:uniqueItems];
}

#pragma mark - Sorting

- (instancetype)sortUsingIndicesArray:(NSArray *)indexArray {
    NSArray *sortedArray = [self sortedArrayUsingComparator:^NSComparisonResult(id class1, id class2) {
        NSUInteger index1 = [indexArray indexOfObject:class1];
        NSUInteger index2 = [indexArray indexOfObject:class2];
        return [SOCIntUtils compare:index1 with:index2];
    }];
    return [self.class arrayWithArray:sortedArray];
}

- (instancetype)reverseArray {
    NSMutableArray *reversedArray = [NSMutableArray arrayWithCapacity:self.count];
    for (id element in [self reverseObjectEnumerator]) {
        [reversedArray addObject:element];
    }
    return [self.class arrayWithArray:reversedArray];
}

#pragma mark - Easy Access

- (id)randomObject {
    if ([self count] > 0) {
        return self[arc4random_uniform([self count])];
    }
    return nil;
}

- (id)secondObject {
    if (self.count > 1) {
        return self[1];
    }
    return nil;
}

- (id)secondLastObject {
    if (self.count > 1) {
        return self[self.count - 2];
    }
    return nil;
}

@end