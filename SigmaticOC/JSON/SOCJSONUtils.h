#import <Foundation/Foundation.h>

/**
 The `SOCJSONUtils` class provides easy conversion from and to JSON.
 */
@interface SOCJSONUtils : NSObject



///------------------------------------
/// @name Conversion to JSON
///------------------------------------

/**
 Convert an arbitrary object to a json string.

 @param object The object to convert.
 @return The JSON string representation.
 @raises SOCInvalidJSONData Raised if the object is or contains objects that cannot be converted.
 */
+ (NSString *)objectToJSON:(id)object;



///------------------------------------
/// @name Conversion from JSON
///------------------------------------

/**
 Convert a JSON string to its equivalent NS object with no options.

 @param json The json string to convert.
 @return The NS object representing the JSON string.
 @raises SOCInvalidJSONData Raised if the string not a valid JSON representation.
 */
+ (id)jsonToObject:(NSString *)json;

/**
 Convert a JSON string to its equivalent NS object with custom options.

 @param json The json string to convert.
 @param options The json reading options.
 @return The NS object representing the JSON string.
 @raises SOCInvalidJSONData Raised if the string not a valid JSON representation.
 */
+ (id)jsonToObject:(NSString *)json options:(NSJSONReadingOptions)options;

@end