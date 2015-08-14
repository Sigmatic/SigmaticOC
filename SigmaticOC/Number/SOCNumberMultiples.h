#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SOCNumberMultiple) {
    SOCMultiplesBase = 1,
    SOCMultipleKilo = 2,
    SOCMultipleMega = 3,
    SOCMultipleGiga = 4,
    SOCMultipleTera = 5,
    SOCMultiplePeta = 6,
    SOCMultipleExa = 7,
    SOCMultipleZetta = 8,
    SOCMultipleYotta = 9
};

static const NSUInteger DECIMAL_MULTIPLIER = 1000;
static const NSUInteger BINARY_MULTIPLIER = 1024;

@interface SOCNumberMultiples : NSObject

+ (double)binaryConvert:(double)amount from:(SOCNumberMultiple)fromType to:(SOCNumberMultiple)toType;

+ (double)decimalConvert:(double)amount from:(SOCNumberMultiple)fromType to:(SOCNumberMultiple)toType;

@end