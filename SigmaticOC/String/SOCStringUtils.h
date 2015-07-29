#import <Foundation/Foundation.h>


@interface SOCStringUtils : NSObject

/*
* Checks if a string is NSNull, nil, has no characters, or is all empty white space.
* */
+ (BOOL)isBlank:(NSString *)aString;

/*
* The opposite of isBlank: Good for readability.
* */
+ (BOOL)isNotBlank:(NSString *)aString;

/*
* Checks if a string is NSNull, nil or has no characters.
* */
+ (BOOL)isEmpty:(NSString *)aString;

/*
* The opposite of isEmpty: Good for readability.
* */
+ (BOOL)isNotEmpty:(NSString *)aString;

/*
* Compares 2 Strings. Takes into account that if 2 strings are nil, they are considered equal.
* */
+ (BOOL)string:(NSString *)first equals:(NSString *)second;

/*
* Compares 2 Strings ignoring case. Takes into account that if 2 strings are nil, they are considered equal.
* */
+ (BOOL)string:(NSString *)first equalsIgnoreCase:(NSString *)second;

@end