#import <Foundation/Foundation.h>


@interface SOCWeakContainer : NSObject

@property(nonatomic, weak) id object;

+ (instancetype)containerWithObject:(id)object;

@end