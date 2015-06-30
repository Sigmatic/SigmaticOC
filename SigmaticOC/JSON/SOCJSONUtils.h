#import <Foundation/Foundation.h>


@interface SOCJSONUtils : NSObject

+ (NSString *)objectToJSONString:(id)object;

+ (id)jsonToObject:(NSString *)json;

+ (id)jsonToObject:(NSString *)json options:(NSJSONReadingOptions)options;
@end