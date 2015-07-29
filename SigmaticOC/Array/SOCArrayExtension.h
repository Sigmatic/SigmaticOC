#import <Foundation/Foundation.h>


@interface NSArray (SOCExtension)

/*
All objects that are kind of class
* */
- (NSArray *)objectsWithClass:(Class)aClass;

/*
Sort using a reference array (7,2,8, sorted using 1,2,3,4,5,6,7,8 returns 2,7,8)
* */
- (NSArray *)sortUsingIndicesArray:(NSArray *)indexArray;

/*
Unique objects in an array. Using the [NSArray containsObject:] to test uniqueness
* */
- (NSArray *)uniqueObjects;

/*
Reversed array 1,2,3 return 3,2,1
* */
- (instancetype)reverseArray;

/*
Any random object
* */
- (id)randomObject;

/*
Is of type NSMutableArray
* */
- (BOOL)isMutable;

@end