#import <Foundation/Foundation.h>


@interface SOCIntegerUtils : NSObject

+ (NSUInteger)integerFromHexString:(NSString *)hexString;

+ (NSComparisonResult)compare:(NSInteger)first with:(NSInteger)second;

@end