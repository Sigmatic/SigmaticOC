#import <Foundation/Foundation.h>

/**
 The `SOCObjectProperties` class provides a utility to get a class list properties at runtime.
 */
@interface SOCObjectProperties : NSObject



///------------------------------------
/// @name Runtime Properties
///------------------------------------

/**
 Get the list of all class properties, including all superclasses including the NSObject class.

 @param aClass The class to get properties for.
 @return The list of all properties
 */
+ (NSArray *)getPropertiesForClass:(Class)aClass;

/**
 Get the list of all class properties, limited by a prefix.
 Example: @"SOC". will only include properties for superclasses that start with SOC.

 @param aClass The class to get properties for.
 @param prefix The superclass prefix to include.
 @return The list of properties limited by superclasses with the prefix.
 */
+ (NSArray *)getPropertiesForClass:(Class)aClass limitWithPrefix:(NSString *)prefix;

@end