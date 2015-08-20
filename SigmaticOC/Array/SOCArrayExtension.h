#import <Foundation/Foundation.h>


@interface NSArray (SOCExtension)

/*
All objects that are kind of class
* */
- (instancetype)objectsWithClass:(Class)aClass;

/*
All objects that are not kind of class
* */
- (instancetype)objectsNotWithClass:(Class)aClass;

/*
Sort using a reference array (7,2,8, sorted using 1,2,3,4,5,6,7,8 returns 2,7,8)
* */
- (instancetype)sortUsingIndicesArray:(NSArray *)indexArray;

/*
Unique objects in an array. Using the [NSArray containsObject:] to test uniqueness
* */
- (instancetype)uniqueObjects;

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