#import <Foundation/Foundation.h>


@interface SOCMethodSwizzler : NSObject

+ (void)swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector inClass:(Class)aClass;

@end