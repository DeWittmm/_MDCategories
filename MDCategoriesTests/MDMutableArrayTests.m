//
//  REKMutableArrayTests.m
//  ReKit
//
//  Created by Michael DeWitt on 11/4/14.
//
//

#import <XCTest/XCTest.h>

#import "NSMutableArray+Removal.h"

@interface REKMutableArrayTests : XCTestCase

@property (strong, nonatomic) NSMutableArray *array;
@property (strong, nonatomic) NSNumber *repeatedObject;
@property (nonatomic) NSInteger numRepeats;

@end

@implementation REKMutableArrayTests

- (void)setUp {
    [super setUp];
    
    self.numRepeats = 3;
    self.repeatedObject = @(2);
    self.array = [[NSMutableArray alloc]initWithArray:@[@"str1", self.repeatedObject, @{@"dict1": @(3)}, self.repeatedObject, @(2)]];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testShowNormalRemoval {
    NSInteger count = [self.array count];

    [self.array removeObject:self.repeatedObject];
    
    XCTAssertEqual(count - self.numRepeats, [self.array count]);
}

- (void)testSingleRemoval {
    NSInteger count = [self.array count];
    
    [self.array md_removeSingleObject:self.repeatedObject];
    
    XCTAssertEqual(count - 1, [self.array count]);
    
    [self.array addObject:self.repeatedObject];
    [self.array removeObject:self.repeatedObject];
    
    XCTAssertNotEqual(count - 1, [self.array count]);
}

- (void)testEnumerateRemoval {
    NSInteger count = [self.array count];
    
    BOOL didRemoveObj =
    [self.array md_enumerateForMutation:^(id obj, NSUInteger idx, BOOL *stop, BOOL *removed) {
        
        if ([obj isEqual: self.repeatedObject]) {
            [self.array removeObjectAtIndex:idx];
            *removed = YES;
        }
    }];
    
    XCTAssertTrue(didRemoveObj);
    XCTAssertEqual(count-self.numRepeats, [self.array count]);
    XCTAssertFalse([self.array containsObject:self.repeatedObject]);
}

@end
