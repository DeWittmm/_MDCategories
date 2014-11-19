//
//  MDColorTests.m
//  MDCategories
//
//  Created by Michael DeWitt on 11/18/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "UIColor+Perception.h"

@interface MDColorTests : XCTestCase

@end

@implementation MDColorTests

- (void)testDark {
    XCTAssertFalse([[UIColor blackColor] md_isPerceivedBright]);
    
    XCTAssertFalse([[UIColor grayColor] md_isPerceivedBright]);

    XCTAssertFalse([[UIColor purpleColor] md_isPerceivedBright]);

    XCTAssertFalse([[UIColor blueColor] md_isPerceivedBright]);
    
    XCTAssertFalse([[UIColor redColor] md_isPerceivedBright]);
}

- (void)testLight {
    XCTAssertTrue([[UIColor whiteColor] md_isPerceivedBright]);

    XCTAssertTrue([[UIColor orangeColor] md_isPerceivedBright]);

    XCTAssertTrue([[UIColor greenColor] md_isPerceivedBright]);
}

- (void)testGranularity {
    CGFloat hue = 1.0;
    CGFloat sat = 1.0;
    CGFloat brt = 1.0;
    CGFloat alp = 1.0;
    
    UIColor *color = [UIColor colorWithHue:hue saturation:sat brightness:brt alpha:alp];
    
    XCTAssertFalse([color md_isPerceivedBright]);
    
    brt = 0.8;
    color = [UIColor colorWithHue:hue saturation:sat brightness:brt alpha:alp];
    
    XCTAssertFalse([color md_isPerceivedBright]);
    
    //Would normally be dark, but reduced alpha
    color = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:0.7];
    
    XCTAssertTrue([color md_isPerceivedBright]);
}

@end
