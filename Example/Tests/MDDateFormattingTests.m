//
//  MDDateFormattingTests.m
//  MDCategories
//
//  Created by Michael DeWitt on 11/17/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>

#import "NSDate+DateComponents.h"
#import "NSDate+DateInRange.h"

@interface MDDateFormattingTests : XCTestCase

@property (strong, nonatomic) NSDate *date1970;

@end

@implementation MDDateFormattingTests

- (void)setUp {
    [super setUp];

    self.date1970 = [NSDate dateWithTimeIntervalSince1970:0];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testComponents {
    NSString *components = [self.date1970 md_dateDayMonthYearComponents];
    
    XCTAssertEqualObjects(components, @"12/31/1969");
    
    self.date1970 = nil;
    components = [self.date1970 md_dateDayMonthYearComponents];
    
    XCTAssertNil(components);
}

- (void)testDateInRange {
    
    NSDate *now = [NSDate date];
    NSDate *before = [NSDate dateWithTimeIntervalSinceNow:-5000];
    NSDate *after = [NSDate dateWithTimeIntervalSinceNow:+5];
    
     XCTAssertTrue([now md_isBetweenStartDate:before andEndDate:after]);
    
    NSArray *possibleDates = @[now, before, after];
    
    for (NSDate *date1 in possibleDates) {

        for (NSDate *date2 in possibleDates) {
            
            XCTAssertFalse([before md_isBetweenStartDate:date1 andEndDate:date2]);
            
            XCTAssertFalse([after md_isBetweenStartDate:date1 andEndDate:date2]);
        }
    }
}



@end
