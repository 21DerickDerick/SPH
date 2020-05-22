//
//  AlertWirefameTests.swift
//  SPHTests
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import XCTest
@testable import SPH

class AlertWirefameTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShowNoInternetConnectionAlert() {
        AlertWireframe.shared.showNoInternetConnectionAlert(inViewController: ApplicationCoordinator.shared.window.rootViewController)
    }
    
    func testShowHasQuarterlyDataUsageDecreaseAlert() {
        AlertWireframe.shared.showHasQuarterlyDataUsageDecreaseAlert(inViewController: ApplicationCoordinator.shared.window.rootViewController, inYear: "2008")
    }
    
}
