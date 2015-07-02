#import <Foundation/Foundation.h>


@interface SOCJSONUtils : NSObject

+ (NSString *)objectToJSON:(id)object;

+ (id)jsonToObject:(NSString *)json;

+ (id)jsonToObject:(NSString *)json options:(NSJSONReadingOptions)options;

@end