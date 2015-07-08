#import <Foundation/Foundation.h>

@interface NSString (SOCExtension)

- (NSString *)trim;

- (NSURL *)toURL;

- (NSString *)urlEncodedWithEncoding:(NSStringEncoding)encoding;

- (NSData *)toBase64;

- (NSString *)toBase64String;

- (NSString *)decodeBase64;

- (BOOL)contains:(NSString *)substring;

+ (NSString *)UUIDString;

- (BOOL)isEqualToStringIgnoreCase:(NSString *)otherString;

@end