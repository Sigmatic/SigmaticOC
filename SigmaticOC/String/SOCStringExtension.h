#import <Foundation/Foundation.h>

@interface NSString (SOCExtension)

+ (NSString *)UUIDString;

- (NSString *)leftPadWith:(NSString *)padding toLength:(NSUInteger)finalLength;

- (NSString *)rightPadWith:(NSString *)padding toLength:(NSUInteger)finalLength;

- (NSString *)trim;

- (NSURL *)toURL;

- (NSString *)urlEncodedWithEncoding:(NSStringEncoding)encoding;

- (NSData *)toBase64;

- (NSString *)toBase64String;

- (NSString *)decodeBase64;

- (BOOL)contains:(NSString *)substring;

- (BOOL)containsIgnoreCase:(NSString *)substring;

- (BOOL)isEqualToStringIgnoreCase:(NSString *)otherString;

- (BOOL)equals:(NSString *)otherString;

- (BOOL)equalsIgnoreCase:(NSString *)otherString;

- (NSString *)replace:(NSString *)target with:(NSString *)replacement;

- (BOOL)matchesRegex:(NSString *)regex;

@end