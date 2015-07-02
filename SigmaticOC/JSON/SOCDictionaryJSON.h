#import <Foundation/Foundation.h>


@interface NSDictionary (SOCJSON)

+ (instancetype)fromJSON:(NSString *)json;

+ (instancetype)safeFromJSON:(NSString *)json;

- (NSString *)toJSON;

- (NSString *)safeToJSON;

@end