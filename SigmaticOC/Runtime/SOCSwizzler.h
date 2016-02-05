#import <Foundation/Foundation.h>


@interface SOCSwizzler : NSObject

+ (void)swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector inClass:(Class)aClass;

@end