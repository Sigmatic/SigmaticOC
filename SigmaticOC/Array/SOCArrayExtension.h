#import <Foundation/Foundation.h>


@interface NSArray (SOCExtension)

//Objects that are KindOfClass
- (NSArray *)objectsWithClass:(Class)aClass;

//Objects that have the exact same class
- (NSArray *)strictObjectsWithClass:(Class)aClass;

- (NSArray *)sortUsingIndicesArray:(NSArray *)indexArray;

- (NSArray *)uniqueObjects;

- (NSInteger)countObjectsWithClass:(Class)class;

- (NSArray *)reverseArray;
@end