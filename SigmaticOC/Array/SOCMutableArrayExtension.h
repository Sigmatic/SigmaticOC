#import <Foundation/Foundation.h>


@interface NSMutableArray (SOCExtension)

- (void)safeAddObject:(id)object;

- (void)addObjectIfNew:(id)object;

- (void)safeAddObjectIfNew:(id)object;

@end