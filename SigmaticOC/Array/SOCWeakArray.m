#import "SOCWeakArray.h"
#import "SOCWeakContainer.h"
#import "SOCMutableArrayExtension.h"


@interface SOCWeakArray ()

@property(nonatomic) Protocol *aProtocol;
@property(nonatomic) NSMutableArray *containersArray;

@end

@implementation SOCWeakArray

#pragma mark - Instantiation

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

#pragma mark - Properties

- (NSArray *)remainingObjects {
    NSMutableArray *results = [NSMutableArray new];
    for (SOCWeakContainer *container in self.containersArray) {
        [results safeAddObject:container.object];
    }
    return [results copy];
}

#pragma mark - Objects Addition

- (void)addObject:(id)object {
    [self checkObject:object];
    SOCWeakContainer *container = [SOCWeakContainer containerWithObject:object];
    [self.containersArray addObject:container];
}

- (void)addObjects:(NSArray *)objects {
    for (id object in objects) {
        [self addObject:object];
    }
}

#pragma mark - Objects Removal

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

#pragma mark - Matching

- (BOOL)containsObject:(id)object {
    return [self.remainingObjects containsObject:object];
}

#pragma mark - House Keeping

- (void)clearReleased {
    NSMutableArray *containersToRemove = [NSMutableArray new];
    for (SOCWeakContainer *container in self.containersArray) {
        if (container.object == nil) {
            [containersToRemove addObject:container];
        }
    }
    [self.containersArray removeObjectsInArray:containersToRemove];
}

- (void)checkObject:(id)object {
    if (self.aProtocol) {
        if (![object conformsToProtocol:self.aProtocol]) {
            NSString *reason = [NSString stringWithFormat:@"Object <%@> does not conform to enforced protocol <%@>", NSStringFromClass([object class]), NSStringFromProtocol(self.aProtocol)];
            NSException *exception = [[NSException alloc] initWithName:@"SOCNotConformingToProtocol" reason:reason userInfo:@{
                    NSLocalizedDescriptionKey : reason
            }];
            @throw exception;
        }
    }
}

@end