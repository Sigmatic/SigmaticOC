#import "SOCMutableDictionaryExtension.h"


@implementation NSMutableDictionary (SOCExtension)


- (void)safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey {
    if (anObject != nil && aKey != nil) {
        self[aKey] = anObject;
    }
}

@end