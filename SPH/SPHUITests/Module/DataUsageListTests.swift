//
//  DataUsageListTests.swift
//  SPHUITests
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import XCTest

class DataUsageListTests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launchArguments = ["isRunningUITest"]
        app.launchEnvironment = ["isRunningUITest": "1"]
        app.launch()
        
        continueAfterFailure = false
    }

    override func tearDown() {
        
    }

    func testYearRange2008To2018() {
        let year2018YearElement = app.staticTexts["2018yearLabel"]
        let year2018Usageelement = app.staticTexts["2018totalUsageLabel"]
        XCTAssertTrue(year2018YearElement.label == "2018")
        XCTAssertTrue(year2018Usageelement.label == "75.35965 PB")
        
        let table = app.tables.firstMatch
        table.swipeUp()
        
        let year2008YearElement = app.staticTexts["2008yearLabel"]
        let year2008Usageelement = app.staticTexts["2008totalUsageLabel"]
        XCTAssertTrue(year2008YearElement.label == "2008")
        XCTAssertTrue(year2008Usageelement.label == "1.543719 PB")
        
        table.swipeDown()
    }
    
    func testClickOn2011ImageView() {
        app.images["2015rightImageView"].tap()
        app.alerts["Quarterly Decrease in 2015"].scrollViews.otherElements.buttons["OK"].tap()
    }

}
