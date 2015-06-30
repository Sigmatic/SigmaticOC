#import "SOCStringExtension.h"


@implementation NSString(SOCExtension)

- (NSURL *)toURL {
    return [[NSURL alloc] initWithString:self];
}

-(NSString *)urlEncodedWithEncoding:(NSStringEncoding)encoding {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
            (CFStringRef)self,
            NULL,
            (CFStringRef)@":/#?&@%+ ;=$,<>~^`\\[]{}|\"",
            CFStringConvertNSStringEncodingToEncoding(encoding)));
}

- (NSData *)toBase64 {
    NSData *data = [NSData dataWithBytes:[self UTF8String] length:[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding]];
    NSUInteger length = [data length];
    NSMutableData *mutableData = [NSMutableData dataWithLength:((length + 2) / 3) * 4];

    uint8_t *input = (uint8_t *)[data bytes];
    uint8_t *output = (uint8_t *)[mutableData mutableBytes];

    for (NSUInteger i = 0; i < length; i += 3) {
        NSUInteger value = 0;
        for (NSUInteger j = i; j < (i + 3); j++) {
            value <<= 8;
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }

        static uint8_t const kAFBase64EncodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

        NSUInteger idx = (i / 3) * 4;
        output[idx + 0] = kAFBase64EncodingTable[(value >> 18) & 0x3F];
        output[idx + 1] = kAFBase64EncodingTable[(value >> 12) & 0x3F];
        output[idx + 2] = (i + 1) < length ? kAFBase64EncodingTable[(value >> 6)  & 0x3F] : '=';
        output[idx + 3] = (i + 2) < length ? kAFBase64EncodingTable[(value >> 0)  & 0x3F] : '=';
    }

    return mutableData;
}

- (NSString *)toBase64String {
    return [[NSString alloc] initWithData:[self toBase64] encoding:NSASCIIStringEncoding];
}

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)decodeBase64 {
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
}

- (BOOL)contains:(NSString *)substring {
    return [self rangeOfString:substring].location != NSNotFound;
}

+ (NSString *)UUIDString {
    return [[NSUUID UUID] UUIDString];
}

@end