//
//  TimeCheckerTests.m
//  TimeCheckerTests
//
//  Created by MikamiHayato on 2016/01/10.
//  Copyright © 2016年 MikamiHayato. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface TimeCheckerTests : XCTestCase

@end

@implementation TimeCheckerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    [self testInclude:2 between:1 and:3];
    [self testInclude:1 between:1 and:1];
    [self testInclude:1 between:22 and:3];

    [self testExclude:0 between:1 and:3];
    [self testExclude:3 between:10 and:20];
}

- (void)testInclude:(int)target between:(int)start and:(int)end{
    XCTAssertTrue([ViewController isInclude:target between:start and:end], @"%d <= %d < %d", start, target, end);
}

- (void)testExclude:(int)target between:(int)start and:(int)end{
    XCTAssertTrue(! [ViewController isInclude:target between:start and:end], @"%d <= %d < %d", start, target, end);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
