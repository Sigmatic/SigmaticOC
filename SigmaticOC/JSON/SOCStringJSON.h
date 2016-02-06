#import <Foundation/Foundation.h>

/**
 The `NSString SOCJSON` extension provides easy conversion to JSON.
 */
@interface NSString (SOCJSON)


///------------------------------------
/// @name Conversion to NS Object
///------------------------------------

/**
 Safely convert the string to a NS object json representation.

 @return The NS object or nil.
 @raise SOCInvalidJSONData Raised if the string is not valid a JSON representation.
 */
- (id)toJSONObject;

/**
 Safely convert the string to a NS json representation.

 @return The NS object or nil.
 */
- (id)safeToJSONObject;
@end