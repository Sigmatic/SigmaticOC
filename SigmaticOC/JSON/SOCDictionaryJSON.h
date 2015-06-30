#import <Foundation/Foundation.h>


@interface NSDictionary (SOCJSON)

+ (instancetype)fromJSONString:(NSString *)json;

+ (instancetype)safeFromJSONString:(NSString *)json;

- (NSString *)toJSONString;

- (NSString *)safeToJSONString;

@end