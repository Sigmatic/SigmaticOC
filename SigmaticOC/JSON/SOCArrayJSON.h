#import <Foundation/Foundation.h>


@interface NSArray (SOCJSON)

+ (instancetype)fromJSON:(NSString *)json;

+ (instancetype)safeFromJSON:(NSString *)json;

- (NSString *)toJSON;

- (NSString *)safeToJSON;

@end