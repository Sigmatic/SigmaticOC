#import <Foundation/Foundation.h>

/**
 The `SOCWeakContainer` class is an object holder with a weak link.
 */
@interface SOCWeakContainer : NSObject



///------------------------------------
/// @name Instantiation
///------------------------------------

/**
 Instantiate a new weak object container.

 @param object The object to hold weakly.
 @return The new weak container instance.
 */
+ (instancetype)containerWithObject:(id)object;



///------------------------------------
/// @name Properties
///------------------------------------

/**
 Held object.
 */
@property(weak, nonatomic) id object;


@end