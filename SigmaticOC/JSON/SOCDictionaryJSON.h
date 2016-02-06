#import <Foundation/Foundation.h>

/**
 The `NSDictionary SOCJSON` extension provides easy conversion from and to JSON.
 */
@interface NSDictionary (SOCJSON)



///------------------------------------
/// @name Instantiation from JSON
///------------------------------------

/**
 Create an instance of the dictionary class from a json string.

 @param json The json string to convert.
 @return The dictionary instance.
 @raises SOCWrongJSONDataType Raised if the json is not a dictionary.
 @raises SOCInvalidJSONData Raised if the json is not valid.
 */
+ (instancetype)fromJSON:(NSString *)json;

/**
 Safely create an instance of the dictionary class from a json string.

 @param json The json string to convert.
 @return The dictionary instance or nil if invalid.
 */
+ (instancetype)safeFromJSON:(NSString *)json;



///------------------------------------
/// @name Conversion to JSON
///------------------------------------

/**
 Convert the dictionary to a json string.

 @return The JSON string representation.
 @raises SOCInvalidJSONData Raised if the dictionary contains objects that cannot be converted.
 */
- (NSString *)toJSON;

/**
 Safely convert the dictionary to a json string.

 @return The JSON string representation or nil.
 */
- (NSString *)safeToJSON;

@end