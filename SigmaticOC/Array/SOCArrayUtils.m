#import "SOCArrayUtils.h"


@implementation SOCArrayUtils

#pragma mark - Arrays Matching

+ (NSArray *)matchingObjectsIn:(NSArray *)firstArray andIn:(NSArray *)secondArray {
    NSMutableArray *results = [NSMutableArray new];
    for (id anObject in firstArray) {
        if ([secondArray containsObject:anObject]) {
            [results addObject:anObject];
        }
    }
    return [results copy];
}

+ (NSArray *)objectsIn:(NSArray *)firstArray butNotIn:(NSArray *)secondArray {
    NSMutableArray *results = [NSMutableArray new];
    for (id anObject in firstArray) {
        if (![secondArray containsObject:anObject]) {
            [results addObject:anObject];
        }
    }
    return [results copy];
}

#pragma mark - Easy Access

+ (BOOL)isEmpty:(NSArray *)array {
    if (array == nil) {
        return YES;
    }
    return array.count == 0;
}

+ (BOOL)isNotEmpty:(NSArray *)array {
    return ![self isEmpty:array];
}

@end