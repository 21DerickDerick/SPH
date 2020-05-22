//
//  UIFontAdditionsTests.swift
//  SPHTests
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import XCTest
@testable import SPH

class UIFontAdditionsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetMainFont() {
        assert(UIFont.main.fontName == "AvenirNext-Regular")
        assert(UIFont.main.pointSize == 24.0)
    }
    
    func testGetSecondaryFont() {
        assert(UIFont.secondary.fontName == "AvenirNext-Regular")
        assert(UIFont.secondary.pointSize == 18.0)
    }

    func testGetTertiaryFont() {
        assert(UIFont.tertiary.fontName == "AvenirNext-Regular")
        assert(UIFont.tertiary.pointSize == 14.0)
    }
}
