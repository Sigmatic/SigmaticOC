#import <Foundation/Foundation.h>


@interface SOCArrayUtils : NSObject

+ (NSArray *)matchingObjectsIn:(NSArray *)firstArray andIn:(NSArray *)secondArray;

+ (NSArray *)objectsIn:(NSArray *)firstArray butNotIn:(NSArray *)secondArray;

+ (BOOL)isEmpty:(NSArray *)array;

+ (BOOL)isNotEmpty:(NSArray *)array;

@end