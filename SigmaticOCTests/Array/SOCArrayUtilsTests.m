#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SOCArrayUtils.h"

@interface SOCArrayUtilsTests : XCTestCase

@end
@implementation SOCArrayUtilsTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testMatchingObjects {
    NSArray *asObject = @[@"1", @"2"];
    NSArray *first = @[@10, @3000, @2, @"Nope", asObject];
    NSArray *second = @[asObject, @3, @"Nope", @10];
    NSArray *actual = [SOCArrayUtils matchingObjectsIn:first andIn:second];
    XCTAssertEqual(3, actual.count);
    XCTAssertTrue([actual containsObject:asObject]);
    XCTAssertTrue([actual containsObject:@"Nope"]);
    XCTAssertTrue([actual containsObject:@10]);
}

- (void)testNonMatchingObjects {
    NSArray *asObject = @[@"1", @"2"];
    NSArray *first = @[@10, @3000, @2, @"Nope", asObject];
    NSArray *second = @[asObject, @3, @"Nope", @10];
    NSArray *actual = [SOCArrayUtils objectsIn:first butNotIn:second];
    XCTAssertEqual(2, actual.count);
    XCTAssertTrue([actual containsObject:@3000]);
    XCTAssertTrue([actual containsObject:@2]);
}

- (void)testIsEmptyWithObjects {
    NSArray *subject = @[@"Something"];
    BOOL actual = [SOCArrayUtils isEmpty:subject];
    XCTAssertTrue(actual == NO);
}

- (void)testIsEmptyWithNil {
    NSArray *subject;
    BOOL actual = [SOCArrayUtils isEmpty:subject];
    XCTAssertTrue(actual);
}

- (void)testIsEmptyWithNone {
    NSArray *subject = @[];
    BOOL actual = [SOCArrayUtils isEmpty:subject];
    XCTAssertTrue(actual);
}

- (void)testIsNotEmptyWithObjects {
    NSArray *subject = @[@"Else"];
    BOOL actual = [SOCArrayUtils isNotEmpty:subject];
    XCTAssertTrue(actual);
}

- (void)testIsNotEmptyWithNil {
    NSArray *subject;
    BOOL actual = [SOCArrayUtils isNotEmpty:subject];
    XCTAssertTrue(actual == NO);
}

- (void)testIsNotEmptyWithNone {
    NSArray *subject = @[];
    BOOL actual = [SOCArrayUtils isNotEmpty:subject];
    XCTAssertTrue(actual == NO);
}

@end