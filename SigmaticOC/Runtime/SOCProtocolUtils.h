#import <Foundation/Foundation.h>


@interface SOCProtocolUtils : NSObject

+ (NSArray *)classesConformingToProtocol:(Protocol *)aProtocol;

+ (BOOL)isObject:(id)object conformingToProtocols:(NSArray *)protocols;

@end