#import <Foundation/Foundation.h>

@interface SOCObjectProperties : NSObject

+ (NSArray *)getPropertiesForClass:(Class)aClass;

+ (NSArray *)getPropertiesForClass:(Class)aClass limitWithPrefix:(NSString *)prefix;

@end