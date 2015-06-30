#import "SOCArrayExtension.h"
#import "SOCIntegerUtils.h"


@implementation NSArray (SOCExtension)

- (NSArray *)objectsWithClass:(Class)aClass {
    NSMutableArray *results = [NSMutableArray new];
    for (id object in self) {
        if ([object isKindOfClass:aClass]) {
            [results addObject:object];
        }
    }
    return [results copy];
}

- (NSArray *)strictObjectsWithClass:(Class)aClass {
    NSMutableArray *results = [NSMutableArray new];
    for (id object in self) {
        if ([object class] == aClass) {
            [results addObject:object];
        }
    }
    return [results copy];
}

- (NSArray *)sortUsingIndicesArray:(NSArray *)indexArray {
    NSArray *sortedArray = [self sortedArrayUsingComparator:^NSComparisonResult(id class1, id class2) {
        NSUInteger index1 = [indexArray indexOfObject:class1];
        NSUInteger index2 = [indexArray indexOfObject:class2];
        return [SOCIntegerUtils compare:index1 with:index2];
    }];
    return sortedArray;
}

- (NSArray *)uniqueObjects {
    NSMutableArray *uniqueItems = [[NSMutableArray alloc] init];
    for (id item in self) {
        if (![uniqueItems containsObject:item]) {
            [uniqueItems addObject:item];
        }
    }
    return [uniqueItems copy];
}

- (NSInteger)countObjectsWithClass:(Class)class {
    return [[self objectsWithClass:class] count];
}

- (NSArray *)reverseArray {
    NSMutableArray *reversedArray = [NSMutableArray arrayWithCapacity:self.count];
    for (id element in [self reverseObjectEnumerator]) {
        [reversedArray addObject:element];
    }
    return [reversedArray copy];
}

@end