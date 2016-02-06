#import <Foundation/Foundation.h>

/**
 The `SOCStringUtils` class adds functionality that might not fit in a NSString instance if nil.
 */
@interface SOCStringUtils : NSObject



///------------------------------------
/// @name Comparison
///------------------------------------

/**
 Checks if a string is NSNull, nil, has no characters, or is all empty white space.

 @param aString the string to check if blank.
 @return Whether the string is blank.
 */
+ (BOOL)isBlank:(NSString *)aString;



/**
 The opposite of isBlank: Good for readability.

 @param aString the string to check if not blank.
 @return Whether the string is not blank.
 */
+ (BOOL)isNotBlank:(NSString *)aString;

/**
 Checks if a string is NSNull, nil or has no characters.

 @param aString the string to check if empty.
 @return Whether the string is empty.
 */
+ (BOOL)isEmpty:(NSString *)aString;

/**
 The opposite of isEmpty: Good for readability.

 @param aString the string to check if not empty.
 @return Whether the string is not empty.
 */
+ (BOOL)isNotEmpty:(NSString *)aString;

/**
 Compares 2 Strings. Takes into account that if 2 strings are nil, they are considered equal.

 @param first the first string to check.
 @param second the first string to check.
 @return Whether the two strings are equal.
 */
+ (BOOL)string:(NSString *)first equals:(NSString *)second;

/**
 Compares 2 Strings, ignoring case. Takes into account that if 2 strings are nil, they are considered equal.

 @param first the first string to check.
 @param second the first string to check.
 @return Whether the two strings are equal.
 */
+ (BOOL)string:(NSString *)first equalsIgnoreCase:(NSString *)second;

@end