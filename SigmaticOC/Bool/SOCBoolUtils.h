#import <Foundation/Foundation.h>


@interface SOCBoolUtils : NSObject

+ (BOOL)fromYesNo:(NSString *)yesNo;

+ (BOOL)fromYN:(NSString *)yN;

+ (BOOL)fromTrueFalse:(NSString *)trueFalse;

+ (BOOL)fromZeroOne:(NSString *)zeroOne;

@end