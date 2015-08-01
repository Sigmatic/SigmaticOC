#import "SOCWeakArray.h"
#import "SOCWeakContainer.h"


@interface SOCWeakArray ()

@property(nonatomic) Protocol *aProtocol;
@property(nonatomic) NSMutableArray *containersArray;

@end

@implementation SOCWeakArray

+ (instancetype)arrayWithForcedProtocol:(Protocol *)aProtocol {
    SOCWeakArray *weakArray = [self new];
    [weakArray setAProtocol:aProtocol];
    return weakArray;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.containersArray = [NSMutableArray new];
    }
    return self;
}

- (void)addObject:(id)object {
    [self checkObject:object];
    SOCWeakContainer *container = [SOCWeakContainer new];
    [self.containersArray addObject:container];
}

- (void)addObjects:(NSArray *)objects {
    for (id object in objects) {
        [self addObject:object];
    }
}

- (void)removeObject:(id)object {
    NSMutableArray *containersToRemove = [NSMutableArray new];
    for (SOCWeakContainer *container in self.containersArray) {
        if ([container.object isEqual:object]) {
            [containersToRemove addObject:container];
        }
    }
    [self.containersArray removeObjectsInArray:containersToRemove];
}

- (void)removeAllObjects {
    [self.containersArray removeAllObjects];
}

- (BOOL)containsObject:(id)object {
    for (SOCWeakContainer *container in self.containersArray) {
        if ([container.object isEqual:object]) {
            return YES;
        }
    }
    return NO;
}

- (void)clearReleased {
    NSMutableArray *containersToRemove = [NSMutableArray new];
    for (SOCWeakContainer *container in self.containersArray) {
        if (container.object == nil) {
            [containersToRemove addObject:container];
        }
    }
    [self.containersArray removeObjectsInArray:containersToRemove];
}

- (NSArray *)remainingObjects {
    NSMutableArray *results = [NSMutableArray new];
    for (SOCWeakContainer *container in self.containersArray) {
        if (container.object) {
            [results addObject:container.object];
        }
    }
    return [results copy];
}

- (void)checkObject:(id)object {
    if (self.aProtocol) {
        if (![object conformsToProtocol:self.aProtocol]) {
            NSString *reason = [NSString stringWithFormat:@"Object <%@> does not conform to enforced protocol <%@>", NSStringFromClass([object class]), NSStringFromProtocol(self.aProtocol)];
            NSException *exception = [[NSException alloc] initWithName:@"SOCNotConformingToProcotol" reason:reason userInfo:@{
                    NSLocalizedDescriptionKey : reason
            }];
            @throw exception;
        }
    }
}

@end