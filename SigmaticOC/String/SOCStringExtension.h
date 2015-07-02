#import <Foundation/Foundation.h>

@interface NSString (SOCExtension)

- (NSURL *)toURL;

- (NSString *)urlEncodedWithEncoding:(NSStringEncoding)encoding;

- (NSData *)toBase64;

- (NSString *)trim;

- (NSString *)decodeBase64;

- (BOOL)contains:(NSString *)substring;

+ (NSString *)UUIDString;

- (BOOL)isEqualToStringIgnoreCase:(NSString *)otherString;

@end