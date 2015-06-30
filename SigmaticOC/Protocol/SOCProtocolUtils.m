#import "SOCProtocolUtils.h"
#import <objc/runtime.h>


@implementation SOCProtocolUtils

+ (NSArray *)classesConformingToProtocol:(Protocol *)aProtocol {
    int numClasses;
    Class *classes = NULL;

    NSMutableArray *conformingClasses = [NSMutableArray new];
    numClasses = objc_getClassList(NULL, 0);
    if (numClasses > 0 ) {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int index = 0; index < numClasses; index++) {
            Class nextClass = classes[index];
            if (class_conformsToProtocol(nextClass, aProtocol)) {
                [conformingClasses addObject:nextClass];
            }
        }
        free(classes);
    }
    return conformingClasses;
}

@end