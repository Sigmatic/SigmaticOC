#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SOCArrayExtension.h"

@interface SOCArrayExtensionTests : XCTestCase

@end
@implementation SOCArrayExtensionTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testObjectsWithClass {
    NSString *oneString = @"ONE";
    NSString *threeString = [[NSMutableString alloc] initWithString:@"3"];
    NSArray *numbers = @[oneString, @2, threeString, @(NO)];
    NSArray *actual = [numbers objectsWithClass:NSString.class];
    XCTAssertEqual(2, actual.count);
    XCTAssertTrue([actual containsObject:oneString]);
    XCTAssertTrue([actual containsObject:threeString]);
}

- (void)testSortUsingIndicesArray {
    NSArray *chaos = @[@5, @3, @1, @2, @4];
    NSArray *sortReference = @[@1, @2, @3, @4, @5, @6, @7];
    NSArray *actual = [chaos sortUsingIndicesArray:sortReference];
    XCTAssertEqual(@1, actual[0]);
    XCTAssertEqual(@2, actual[1]);
    XCTAssertEqual(@3, actual[2]);
    XCTAssertEqual(@4, actual[3]);
    XCTAssertEqual(@5, actual[4]);
}

- (void)testUniqueObjects {
    NSArray *withDuplicates = @[@1, @1, @2, @3];
    NSArray *actual = [withDuplicates uniqueObjects];
    XCTAssertEqual(3, actual.count);
    XCTAssertTrue([actual containsObject:@1]);
    XCTAssertTrue([actual containsObject:@2]);
    XCTAssertTrue([actual containsObject:@3]);
}

- (void)testReverseArray {
    NSArray *leftRight = @[@1, @1, @2, @3];
    NSArray *actual = [leftRight reverseArray];
    XCTAssertEqual(@3, actual[0]);
    XCTAssertEqual(@2, actual[1]);
    XCTAssertEqual(@1, actual[2]);
    XCTAssertEqual(@1, actual[3]);
}

- (void)testReverseKeepsType {
    NSMutableArray *leftRight = [@[@1, @1, @2, @3] mutableCopy];
    NSArray *actual = [leftRight reverseArray];
    XCTAssertTrue([actual isKindOfClass:[NSMutableArray class]]);
}

@end