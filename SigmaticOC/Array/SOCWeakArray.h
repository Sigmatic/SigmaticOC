#import <Foundation/Foundation.h>

/**
 The `SOCWeakArray` class adds an NSMutableArray wrapper to hold objects weakly.
 */
@interface SOCWeakArray : NSObject

///------------------------------------
/// @name Instantiation
///------------------------------------

/**
 Instantiate a new weak array with a forced protocol for added objects.

 @param aProtocol The protocol to enforce.
 @return The new weak array instance.
 */
+ (instancetype)arrayWithForcedProtocol:(Protocol *)aProtocol;

///------------------------------------
/// @name Properties
///------------------------------------

/**
 Objects that are still in memory and have not been released.
 */
@property(nonatomic, readonly) NSArray *remainingObjects;

///------------------------------------
/// @name Objects Addition
///------------------------------------

/**
 Add an object and weakly reference it in the array.

 @param object The object to add.
 */
- (void)addObject:(id)object;

/**
 Add an array of objects and weakly reference them in the array.

 @param objects The array of objects to add.
 */
- (void)addObjects:(NSArray *)objects;

///------------------------------------
/// @name Objects Removal
///------------------------------------

/**
 Remove an object from the array if it still exists.

 @param object The object to remove.
 */
- (void)removeObject:(id)object;

/**
 Remove all objects from the array.

 */
- (void)removeAllObjects;

///------------------------------------
/// @name Matching
///------------------------------------

/**
 Check if an object is contained in the array.

 @param object The object to check for.
 */
- (BOOL)containsObject:(id)object;

///------------------------------------
/// @name House Keeping
///------------------------------------

/**
 If you would like, remove the empty containers in the internal array.

 */
- (void)clearReleased;

@end