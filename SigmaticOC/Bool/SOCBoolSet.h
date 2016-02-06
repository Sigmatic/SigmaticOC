#import <Foundation/Foundation.h>

/**
 The `SOCBoolSet` class provides a true false pair for checking user input.
 */
@interface SOCBoolSet : NSObject

///------------------------------------
/// @name Instantiation
///------------------------------------

/**
 Instantiate a new boolean string set.

 @param trueString The string that describes a true value.
 @param falseString The string that describes a false value.
 @return The new boolean set instance.
 */
+ (instancetype)setWithTrueString:(NSString *)trueString falseString:(NSString *)falseString;

/**
 Instantiate a 'Yes' 'No' set.

 @return The new boolean set instance.
 */
+ (instancetype)yesNoSet;

/**
 Instantiate a 'Y' 'N' set.

 @return The new boolean set instance.
 */
+ (instancetype)yNSet;

/**
 Instantiate a 'True' 'False' set.

 @return The new boolean set instance.
 */
+ (instancetype)trueFalseSet;

/**
 Instantiate a '1' '0' set.

 @return The new boolean set instance.
 */
+ (instancetype)oneZeroSet;

///------------------------------------
/// @name Properties
///------------------------------------

/**
 True string to match.
 */
@property(nonatomic) NSString *trueString;

/**
 False string to match.
 */
@property(nonatomic) NSString *falseString;


///------------------------------------
/// @name Matching
///------------------------------------

/**
 Check if a value is considered true.

 @param string The string to match.
 @return Whether the value is true.
 */
- (BOOL)isTrue:(NSString *)string;

/**
 Check if a value is considered false.

 @param string The string to match.
 @return Whether the value is false.
 */
- (BOOL)isFalse:(NSString *)string;

/**
 Convert a boolean to a string representation from the set.

 @param truthBool The boolean to describe.
 @return A string representing the boolean.
 */
- (NSString *)describe:(BOOL)truthBool;

/**
 Check if a value is considered true using best guess.

 @param ambiguous The string to match.
 @return Whether the value is true.
 */
+ (BOOL)bestGuess:(NSString *)ambiguous;

/**
 Check if a value is considered true using the 'YesNo' set.

 @param yesNo The string to match.
 @return Whether the value is true.
 */
+ (BOOL)fromYesNo:(NSString *)yesNo;

/**
 Check if a value is considered true using the 'YN' set.

 @param yN The string to match.
 @return Whether the value is true.
 */
+ (BOOL)fromYN:(NSString *)yN;

/**
 Check if a value is considered true using the 'TrueFalse' set.

 @param trueFalse The string to match.
 @return Whether the value is true.
 */
+ (BOOL)fromTrueFalse:(NSString *)trueFalse;

/**
 Check if a value is considered true using the '10' set.

 @param oneZero The string to match.
 @return Whether the value is true.
 */
+ (BOOL)fromOneZero:(NSString *)oneZero;

@end