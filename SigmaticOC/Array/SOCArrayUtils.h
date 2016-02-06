#import <Foundation/Foundation.h>

/**
 The `SOCArrayUtils` class adds functionality that might not fit in a NSArray instance if nil.
 */
@interface SOCArrayUtils : NSObject



///-----------------------
/// @name Arrays Matching
///-----------------------

/**
 Filters object that exist in both arrays.

 @param firstArray the first array to match.
 @param secondArray the second array to match.
 @return An array with the matching objects only.
 */
+ (NSArray *)matchingObjectsIn:(NSArray *)firstArray andIn:(NSArray *)secondArray;

/**
 Filters object that exist in the first array but not the second.

 @param firstArray the first array to match.
 @param secondArray the second array to match.
 @return An array with objects only occurring in the first array.
 */
+ (NSArray *)objectsIn:(NSArray *)firstArray butNotIn:(NSArray *)secondArray;



///-----------------------
/// @name Easy Access
///-----------------------

/**
 Is an array empty or nil.

 @return True if the array is empty or nil, false otherwise.
 */
+ (BOOL)isEmpty:(NSArray *)array;

/**
 Is an array NOT empty.

 @return True if the array is NOT empty, false otherwise.
 */
+ (BOOL)isNotEmpty:(NSArray *)array;

@end