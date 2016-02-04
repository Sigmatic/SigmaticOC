#import "SOCProperty.h"
#import <objc/message.h>

@implementation SOCProperty

- (SEL)getter {
    if (self.customGetter.length > 0) {
        return NSSelectorFromString(self.customGetter);
    }
    return NSSelectorFromString(self.name);
}

- (SEL)setter {
    if (self.customSetter.length > 0) {
        return NSSelectorFromString(self.customSetter);
    }
    NSString *upperCaseFirstSetter = [self.name stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                                                        withString:[[self.name substringToIndex:1] uppercaseString]];
    NSString *normalSetter = [NSString stringWithFormat:@"set%@:", upperCaseFirstSetter];
    return NSSelectorFromString(normalSetter);
}


- (BOOL)setValueTo:(id)newValue onObject:(id)object {
    SEL setSelector = [self setter];
    if ([object respondsToSelector:setSelector]) {
        ((void (*)(id, SEL, id)) objc_msgSend)(object, setSelector, newValue);
    }
    return NO;
}

- (id)getValueFrom:(id)object {
    SEL getSelector = [self getter];
    if ([object respondsToSelector:getSelector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [object performSelector:getSelector];
#pragma clang diagnostic pop
    }
    return nil;
}

@end