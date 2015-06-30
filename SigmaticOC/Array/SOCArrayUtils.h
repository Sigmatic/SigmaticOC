#import <Foundation/Foundation.h>


@interface SOCArrayUtils : NSObject

+ (NSArray *)matchingObjectsIn:(NSArray *)firstArray andIn:(NSArray *)secondArray;

+ (BOOL)isEmpty:(NSArray *)array;

@end