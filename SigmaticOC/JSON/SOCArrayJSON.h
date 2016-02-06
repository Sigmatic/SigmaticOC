#import <Foundation/Foundation.h>

/**
 The `NSArray SOCJSON` extension provides easy conversion from and to JSON.
 */
@interface NSArray (SOCJSON)

///------------------------------------
/// @name Instantiation from JSON
///------------------------------------

/**
 Create an instance of the array class from a json string.

 @param json The json string to convert.
 @return The array instance.
 @raises SOCWrongJSONDataType Raised if the json is not an array.
 @raises SOCInvalidJSONData Raised if the json is not valid.
 */
+ (instancetype)fromJSON:(NSString *)json;

/**
 Safely create an instance of the array class from a json string.

 @param json The json string to convert.
 @return The array instance or nil if invalid.
 */
+ (instancetype)safeFromJSON:(NSString *)json;



///------------------------------------
/// @name Conversion to JSON
///------------------------------------

/**
 Convert the array to a json string.

 @return The JSON string representation.
 @raises SOCInvalidJSONData Raised if the array contains objects that cannot be converted.
 */
- (NSString *)toJSON;

/**
 Safely convert the array to a json string.

 @return The JSON string representation or nil.
 */
- (NSString *)safeToJSON;

@end