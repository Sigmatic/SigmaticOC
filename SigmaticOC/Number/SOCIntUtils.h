#import <Foundation/Foundation.h>


@interface SOCIntUtils : NSObject

+ (NSUInteger)intFromHexString:(NSString *)hexString;

+ (NSComparisonResult)compare:(NSInteger)first with:(NSInteger)second;

+ (NSUInteger)randomIntBetween:(NSUInteger)from and:(NSUInteger)to;

+ (NSUInteger)randomInt;

@end