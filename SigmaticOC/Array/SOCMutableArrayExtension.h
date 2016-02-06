#import <Foundation/Foundation.h>

/**
 The `NSMutableArray SOCExtension` extension adds convenient functionality for manipulating mutable arrays.
 */
@interface NSMutableArray (SOCExtension)



///-----------------------
/// @name Objects Removal
///-----------------------

/**
 Remove objects that are kind of class from the array.

 @param aClass The class to filter out.
 */
- (void)removeObjectsWithClass:(Class)aClass;

/**
 Remove objects that are NOT kind of class from the array.

 @param aClass The class to keep.
 */
- (void)removeObjectsNotWithClass:(Class)aClass;



///-----------------------
/// @name Objects Addition
///-----------------------

/**
 Safely add an object if it is not nil.

 @param object The object to add.
 */
- (void)safeAddObject:(id)object;

/**
 Add an object if it does not already exist in the array.

 @param object The object to add.
 */
- (void)addObjectIfNew:(id)object;

/**
 Safely Add an object if it does not already exist in the array and not nil.

 @param object The object to add.
 */
- (void)safeAddObjectIfNew:(id)object;

/**
 Add or remove the object based on whether it exists in the array.

 @param object The object to toggle (in or out).
 */
- (void)toggleObject:(id)object;

@end