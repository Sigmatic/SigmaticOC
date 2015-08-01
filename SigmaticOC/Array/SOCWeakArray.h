#import <Foundation/Foundation.h>


@interface SOCWeakArray : NSObject

@property(nonatomic, readonly) NSArray *remainingObjects;

+ (instancetype)arrayWithForcedProtocol:(Protocol *)aProtocol;

- (void)addObject:(id)object;

- (void)addObjects:(NSArray *)objects;

- (void)removeObject:(id)object;

- (void)removeAllObjects;

- (BOOL)containsObject:(id)object;

- (void)clearReleased;

@end