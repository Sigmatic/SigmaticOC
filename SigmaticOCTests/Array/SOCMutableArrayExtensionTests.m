#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SOCMutableArrayExtension.h"

@interface SOCMutableArrayExtensionTests : XCTestCase

@end
@implementation SOCMutableArrayExtensionTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSafeAddWithNil {
    NSMutableArray *subject = [@[] mutableCopy];
    [subject safeAddObject:nil];
    XCTAssertEqual(0, subject.count);
}

- (void)testSafeAddWithObject {
    NSMutableArray *subject = [@[] mutableCopy];
    [subject safeAddObject:@"Yes"];
    XCTAssertEqual(1, subject.count);
    XCTAssertTrue([subject containsObject:@"Yes"]);
}

- (void)testAddObjectIfNewWithExisting {
    NSMutableArray *subject = [@[@"Yes", @"No"] mutableCopy];
    [subject addObjectIfNew:@"Yes"];
    XCTAssertEqual(2, subject.count);
}

- (void)testAddObjectIfNewWithNewObject {
    NSMutableArray *subject = [@[@"Yes"] mutableCopy];
    [subject addObjectIfNew:@"No"];
    XCTAssertEqual(2, subject.count);
    XCTAssertTrue([subject containsObject:@"No"]);
}

- (void)testSafeAddObjectIfNewWithNil {
    NSMutableArray *subject = [@[@"Yes"] mutableCopy];
    [subject safeAddObjectIfNew:nil];
    XCTAssertEqual(1, subject.count);
}

- (void)testSafeAddObjectIfNewWithExisting {
    NSMutableArray *subject = [@[@"Yes"] mutableCopy];
    [subject safeAddObjectIfNew:@"Yes"];
    XCTAssertEqual(1, subject.count);
}

- (void)testSafeAddObjectIfNewWithNewObject {
    NSMutableArray *subject = [@[@"Yes"] mutableCopy];
    [subject safeAddObjectIfNew:@"No"];
    XCTAssertEqual(2, subject.count);
    XCTAssertTrue([subject containsObject:@"No"]);
}

@end