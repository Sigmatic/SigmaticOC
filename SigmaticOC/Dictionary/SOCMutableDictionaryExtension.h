#import <Foundation/Foundation.h>


@interface NSMutableDictionary (SOCExtension)

- (void)safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey;

@end