//
//  MDDateFormattingTests.m
//  MDCategories
//
//  Created by Michael DeWitt on 11/17/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NSDate+ComponentsDateFormattor.h"

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
    
    XCTAssertEqualObjects(components, @"12/13/1969");
}

- (void)testDateRange {
    
}

@end
