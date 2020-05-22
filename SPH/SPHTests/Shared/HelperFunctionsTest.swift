//
//  HelperFunctionsTest.swift
//  SPHTests
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import XCTest
@testable import SPH

class HelperFunctionsTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsNotRunningTest() {
        XCTAssertTrue(isRunningTests == false)
    }
}
