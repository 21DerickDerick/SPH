//
//  EntryTests.swift
//  SPHTests
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import XCTest
@testable import SPH

class EntryTests: XCTestCase {

    override func setUp() {}

    override func tearDown() {}

    func testGet2008YearlyUsageAmount() {
        let entry = Entry()
        entry.year = "2008"
        
        let recordQ1 = Record(volumeOfMobileData: "0.171586", quarter: "2008-Q1", id: 15)
        let recordQ2 = Record(volumeOfMobileData: "0.248899", quarter: "2008-Q2", id: 16)
        let recordQ3 = Record(volumeOfMobileData: "0.439655", quarter: "2008-Q3", id: 17)
        let recordQ4 = Record(volumeOfMobileData: "0.683579", quarter: "2008-Q4", id: 18)

        entry.records = [recordQ1, recordQ2, recordQ3, recordQ4]
        
        assert(entry.getYearlyUsageAmount() == "1.543719 PB")
    }
    
    func testYearlyUsageAmountWithEmptyRecord() {
        let entry = Entry()
        assert(entry.getYearlyUsageAmount() == "0.0 PB")
    }
    
    func testNoQuarterlyDecrease() {
        let entry = Entry()
        entry.year = "2008"
        
        let recordQ1 = Record(volumeOfMobileData: "0.171586", quarter: "2008-Q1", id: 15)
        let recordQ2 = Record(volumeOfMobileData: "0.248899", quarter: "2008-Q2", id: 16)
        let recordQ3 = Record(volumeOfMobileData: "0.439655", quarter: "2008-Q3", id: 17)
        let recordQ4 = Record(volumeOfMobileData: "0.683579", quarter: "2008-Q4", id: 18)
        
        entry.records = [recordQ1, recordQ2, recordQ3, recordQ4]
        
        assert(entry.hasQuarterlyDecrease() == false)
    }
    
    func testHasQuarterlyDecrease() {
        let entry = Entry()
        entry.year = "2011"
        
        let recordQ1 = Record(volumeOfMobileData: "3.466228", quarter: "2011-Q1", id: 27)
        let recordQ2 = Record(volumeOfMobileData: "3.380723", quarter: "2011-Q2", id: 28)
        let recordQ3 = Record(volumeOfMobileData: "3.713792", quarter: "2011-Q3", id: 29)
        let recordQ4 = Record(volumeOfMobileData: "4.07796", quarter: "2011-Q4", id: 30)
        
        entry.records = [recordQ1, recordQ2, recordQ3, recordQ4]
        
        assert(entry.hasQuarterlyDecrease() == true)
    }

}
