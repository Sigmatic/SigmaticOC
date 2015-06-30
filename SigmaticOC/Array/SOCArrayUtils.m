#import "SOCArrayUtils.h"


@implementation SOCArrayUtils

+ (NSArray *)matchingObjectsIn:(NSArray *)firstArray andIn:(NSArray *)secondArray {
    NSMutableArray *results = [NSMutableArray new];
    for (id anObject in firstArray) {
        if ([secondArray containsObject:anObject]) {
            [results addObject:anObject];
        }
    }
    return [results copy];
}

+ (BOOL)isEmpty:(NSArray *)array {
    if (array == nil) {
        return NO;
    }
    return array.count > 0;
}

+ (BOOL)isNotEmpty:(NSArray *)array {
    return ![self isEmpty:array];
}

@end