#import <Foundation/Foundation.h>


@interface NSMutableArray (SOCExtension)

- (void)removeObjectsWithClass:(Class)aClass;

- (void)removeObjectsNotWithClass:(Class)aClass;

- (void)safeAddObject:(id)object;

- (void)addObjectIfNew:(id)object;

- (void)safeAddObjectIfNew:(id)object;

@end