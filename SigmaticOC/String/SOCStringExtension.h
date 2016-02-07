#import <Foundation/Foundation.h>

/**
 The `NSString SOCExtension` extension provides convenient string instantiation and manipulation.
 */
@interface NSString (SOCExtension)



///------------------------------------
/// @name Instantiation
///------------------------------------

/**
 Create a new string with a single char.

 @param aChar the char to use to create the string.
 @return The string based on that char.
 */
+ (instancetype)stringWithUnichar:(unichar)aChar;

/**
 Create a new UUID.

 @return The UUID string.
 */
+ (NSString *)UUIDString;



///------------------------------------
/// @name Padding
///------------------------------------
/**
 Left pad the string with another string, to read a certain length.

 @param padding the string to use as padding.
 @param finalLength the desired final length of the string.
 @return The product of the padding.
 */
- (NSString *)leftPadWith:(NSString *)padding toLength:(NSUInteger)finalLength;


/**
 Right pad the string with another string, to read a certain length.

 @param padding the string to use as padding.
 @param finalLength the desired final length of the string.
 @return The product of the padding.
 */
- (NSString *)rightPadWith:(NSString *)padding toLength:(NSUInteger)finalLength;



///------------------------------------
/// @name Manipulation
///------------------------------------

/**
 Trim white space.

 @return The product after trimming.
 */
- (instancetype)trim;

/**
 URL encode the string.

 @param encoding The encoded type.
 @return The encoded string.
 */
- (NSString *)urlEncodedWithEncoding:(NSStringEncoding)encoding;

/**
 Replace all occurrences of a string with another string.

 @param target The string to replace.
 @param replacement The other string to replace it with.
 @return The product of the replacement.
 */
- (NSString *)replace:(NSString *)target with:(NSString *)replacement;



///------------------------------------
/// @name Conversion
///------------------------------------
/**
 Convert to an NSURL.

 @return The NSURL.
 */
- (NSURL *)toURL;

/**
 Convert to Base64 NSData.

 @return The Base64 data representation.
 */
- (NSData *)toBase64;

/**
 Convert to Base64 String.

 @return The Base64 data representation as a string.
 */
- (NSString *)toBase64String;

/**
 Decode considering it is a Base64 data string.

 @return The decoded string.
 */
- (NSString *)decodeBase64;



///------------------------------------
/// @name Matching and Checking
///------------------------------------

/**
 Check if a string is contained as a substring.

 @param substring The substring to check if it is contained.
 @return Whether the string is contained in this string.
 */
- (BOOL)contains:(NSString *)substring;

/**
 Check if a string is contained as a substring - case insensitive.

 @param substring The substring to check if it is contained.
 @return Whether the string is contained in this string.
 */
- (BOOL)containsIgnoreCase:(NSString *)substring;

/**
 Check if a string equal to another string - case insensitive.

 @param otherString The other string to check if it is equal.
 @return Whether the two strings are equal.
 */
- (BOOL)isEqualToStringIgnoreCase:(NSString *)otherString;

/**
 Check if a string equal to another string - case sensitive.

 @param otherString The other string to check if it is equal.
 @return Whether the two strings are equal.
 */
- (BOOL)equals:(NSString *)otherString;

/**
 Check if a string equal to another string - case insensitive.

 @param otherString The other string to check if it is equal.
 @return Whether the two strings are equal.
 */
- (BOOL)equalsIgnoreCase:(NSString *)otherString;

/**
 Check if the string matches a regular expression.

 @param regex The regular expression to match against.
 @return Whether the string matches the regular expression.
 */
- (BOOL)matchesRegex:(NSString *)regex;



///------------------------------------
/// @name Characters
///------------------------------------

/**
 Loop through each character in the string and execute a code block on them.

 @param block The code block to execute for each character.
 */
- (void)forEachCharacter:(void (^)(NSString *))block;

/**
 Get a character at a specific index as a string.

 @param index The index of the character.
 @return The character as a string.
 */
- (NSString *)characterAtIndexAsString:(NSUInteger)index;

@end