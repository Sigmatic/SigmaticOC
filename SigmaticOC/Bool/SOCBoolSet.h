#import <Foundation/Foundation.h>


@interface SOCBoolSet : NSObject

@property(nonatomic) NSString *trueString;
@property(nonatomic) NSString *falseString;

+ (instancetype)newWithTrueString:(NSString *)trueString falseString:(NSString *)falseString;

+ (instancetype)yesNoSet;

+ (instancetype)yNSet;

+ (instancetype)trueFalseSet;

+ (instancetype)zeroOneSet;

- (BOOL)isTrue:(NSString *)string;

- (BOOL)isFalse:(NSString *)string;

@end