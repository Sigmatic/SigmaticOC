#import <XCTest/XCTest.h>
#import "SOCObjectProperties.h"
#import "SOCTestController.h"


@interface SOCObjectPropertiesTests : XCTestCase

@end

@implementation SOCObjectPropertiesTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPerformanceOfViewControllerProperties {
    [self measureBlock:^{
        NSArray *propertiesForClass = [SOCObjectProperties getPropertiesForClass:[SOCTestController class]];
        NSLog(@"Got properties, %@", @(propertiesForClass.count));
    }];
}

@end