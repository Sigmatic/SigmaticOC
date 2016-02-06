#import <Foundation/Foundation.h>

/**
 The `NSDictionary SOCExtension` extension provides easy access to properties.
 */
@interface NSDictionary (SOCExtension)



///------------------------------------
/// @name Properties
///------------------------------------

/**
 Is of type NSMutableDictionary.
 */
@property(nonatomic, readonly) BOOL isMutable;

@end