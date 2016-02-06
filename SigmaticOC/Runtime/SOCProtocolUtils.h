#import <Foundation/Foundation.h>

/**
 The `SOCProtocolUtils` class provides utilities to get classes conforming to a protocol and check conformation.
 */
@interface SOCProtocolUtils : NSObject



///------------------------------------
/// @name Various
///------------------------------------

/**
 Get a list of classes that conform to a specific protocol.

 @param aProtocol the protocol to check for.
 @return The list of conforming classes.
 */
+ (NSArray *)classesConformingToProtocol:(Protocol *)aProtocol;

/**
 Check if a class conforms to all protocols in the list.

 @param aClass the class to check conformation for.
 @param protocols the protocols to check for.
 @return Whether the object conforms to all protocols.
 */
+ (BOOL)isClass:(Class)aClass conformingToProtocols:(NSArray *)protocols;

@end