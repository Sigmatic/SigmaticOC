#import <Foundation/Foundation.h>

/**
 The `NSMutableDictionary SOCExtension` extension provides easy manipulation of NSMutableDictionary.
 */
@interface NSMutableDictionary (SOCExtension)


///-----------------------
/// @name Objects Addition
///-----------------------

/**
 Safely add an object with a key if both not nil.

 @param anObject The object to add.
 @param aKey The key to associate it with.
 */
- (void)safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey;

@end