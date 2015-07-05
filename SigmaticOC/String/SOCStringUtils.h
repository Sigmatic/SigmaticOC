#import <Foundation/Foundation.h>


@interface SOCStringUtils : NSObject

/*
* Checks if a string is NSNull, has no characters, or is all empty white space
* */
+ (BOOL)isBlank:(NSString *)aString;

/*
* The opposite of isBlank: Good for readability.
* */
+ (BOOL)isNotBlank:(NSString *)aString;

/*
* Compares 2 Strings. Takes into account that if 2 strings are nil, they are considered equal
* */
+ (BOOL)string:(NSString *)first equals:(NSString *)second;

@end