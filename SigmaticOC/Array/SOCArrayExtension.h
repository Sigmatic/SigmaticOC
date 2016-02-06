#import <Foundation/Foundation.h>

/**
 The `NSArray SOCExtension` extension adds convenient functions to the NSArray class.
 */
@interface NSArray (SOCExtension)


///------------------------------------
/// @name Properties
///------------------------------------

/**
 Is of type NSMutableArray.
 */
@property(nonatomic, readonly) BOOL isMutable;

///-----------------------
/// @name Filtering
///-----------------------

/**
 Filters the array with only objects that are kind of class.

 @param aClass The class to filter for.
 @return An array with the same NSArray class (or subclass) with the filtered items.
 */
- (instancetype)objectsWithClass:(Class)aClass;

/**
 Filters the array with only objects that are NOT kind of class.

 @param aClass The class to filter out.
 @return An array with the same NSArray class (or subclass) with the filtered items.
 */
- (instancetype)objectsNotWithClass:(Class)aClass;

/**
Filters unique objects in an array. Using the [NSArray containsObject:] to test uniqueness.

@return An array with the same NSArray class (or subclass) with the filtered items.
*/
- (instancetype)uniqueObjects;


///-----------------------
/// @name Sorting
///-----------------------


/**
 Sorts the array using a reference array (7,2,8, sorted using 1,2,3,4,5,6,7,8 returns 2,7,8).

 @param indexArray The array to use as reference sorting array.
 @return An array with the same NSArray class (or subclass) with the sorted items.
 */
- (instancetype)sortUsingIndicesArray:(NSArray *)indexArray;

/**
 Sorts the array in reverse order. Reversing array 1,2,3 returns 3,2,1.

 @return An array with the same NSArray class (or subclass) with the sorted items.
 */
- (instancetype)reverseArray;


///-----------------------
/// @name Easy Access
///-----------------------

/**
 Any random object from the array.

 @return A random object.
 */
- (id)randomObject;

/**
 Second object in the array if any.

 @return the second object or nil.
 */
- (id)secondObject;

/**
 Second last object in the array if any.

 @return the second last object or nil.
 */
- (id)secondLastObject;

@end