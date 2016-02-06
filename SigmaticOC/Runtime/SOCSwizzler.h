#import <Foundation/Foundation.h>

/**
 The `SOCSwizzler` class provides a utility to swap a method for a class.
 */
@interface SOCSwizzler : NSObject



///------------------------------------
/// @name Swizzling
///------------------------------------

/**
 Swizzle a selector for another in a specific class.

 @param originalSelector the selector to change.
 @param swizzledSelector the new selector to exchange it with.
 @param aClass the class to exchange the selectors for.
 */
+ (void)swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector inClass:(Class)aClass;

@end