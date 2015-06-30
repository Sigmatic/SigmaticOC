#import <Foundation/Foundation.h>


@interface NSArray(SOCExtension)

//Objects that are KindOfClass
- (NSArray *)objectsWithClass:(Class)aClass;

//Objects that are have the exact same class
- (NSArray *)strictObjectsWithClass:(Class)aClass;

- (NSArray *)sortUsingIndicesArray:(NSArray *)indexArray;

- (NSArray *)uniqueObjects;

- (NSInteger)countObjectsWithClass:(Class)class;
@end