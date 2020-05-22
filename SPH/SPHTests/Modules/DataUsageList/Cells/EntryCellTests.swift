//
//  EntryCellTests.swift
//  SPHTests
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import XCTest
@testable import SPH

class EntryCellTests: XCTestCase {

    var yearLabel: UILabel!
    var totalUsageLabel: UILabel!
    var rightImageView: UIImageView!
    var cardView: UIView!
    
    override func setUp() {
        yearLabel = UILabel()
        totalUsageLabel = UILabel()
        rightImageView = UIImageView()
        cardView = UIView()
    }

    override func tearDown() {
        yearLabel = nil
        totalUsageLabel = nil
        rightImageView = nil
        cardView = nil
    }

    func testInitializeUI() {
        let cell = EntryCell()
        cell.yearLabel = yearLabel
        cell.totalUsageLabel = totalUsageLabel
        cell.rightImageView = rightImageView
        cell.cardView = cardView
        
        cell.awakeFromNib()
        
        XCTAssertTrue(cell.cardView.backgroundColor == .mainBlue)
        XCTAssertTrue(cell.cardView.layer.cornerRadius == 4)
        XCTAssertTrue(cell.yearLabel.textColor == .lightBlue)
        XCTAssertTrue(cell.yearLabel.font == .tertiary)
        XCTAssertTrue(cell.totalUsageLabel.textColor == .white)
        XCTAssertTrue(cell.totalUsageLabel.font == .secondary)
        XCTAssertTrue(cell.rightImageView.isUserInteractionEnabled == true)
    }
    
    func testSetValue() {
        let entry = Entry()
        entry.year = "2008"
        
        let recordY08Q1 = Record(volumeOfMobileData: "0.171586", quarter: "2008-Q1", id: 15)
        let recordY08Q2 = Record(volumeOfMobileData: "0.248899", quarter: "2008-Q2", id: 16)
        let recordY08Q3 = Record(volumeOfMobileData: "0.439655", quarter: "2008-Q3", id: 17)
        let recordY08Q4 = Record(volumeOfMobileData: "0.683579", quarter: "2008-Q4", id: 18)
        
        let recordY09Q1 = Record(volumeOfMobileData: "0.171586", quarter: "2009-Q1", id: 15)
        let recordY09Q2 = Record(volumeOfMobileData: "0.248899", quarter: "2009-Q2", id: 16)
        let recordY09Q3 = Record(volumeOfMobileData: "0.439655", quarter: "2009-Q3", id: 17)
        let recordY09Q4 = Record(volumeOfMobileData: "0.683579", quarter: "2009-Q4", id: 18)
        
        let recordY10Q1 = Record(volumeOfMobileData: "0.171586", quarter: "2010-Q1", id: 15)
        let recordY10Q2 = Record(volumeOfMobileData: "0.248899", quarter: "2010-Q2", id: 16)
        let recordY10Q3 = Record(volumeOfMobileData: "0.439655", quarter: "2010-Q3", id: 17)
        let recordY10Q4 = Record(volumeOfMobileData: "0.683579", quarter: "2010-Q4", id: 18)
        
        let recordY11Q1 = Record(volumeOfMobileData: "0.171586", quarter: "2011-Q1", id: 15)
        let recordY11Q2 = Record(volumeOfMobileData: "0.248899", quarter: "2011-Q2", id: 16)
        let recordY11Q3 = Record(volumeOfMobileData: "0.439655", quarter: "2011-Q3", id: 17)
        let recordY11Q4 = Record(volumeOfMobileData: "0.683579", quarter: "2011-Q4", id: 18)

        let records = [
            recordY08Q1, recordY08Q2, recordY08Q3, recordY08Q4,
            recordY09Q1, recordY09Q2, recordY09Q3, recordY09Q4,
            recordY10Q1, recordY10Q2, recordY10Q3, recordY10Q4,
            recordY11Q1, recordY11Q2, recordY11Q3, recordY11Q4
        ]
        
        entry.records = records
        
        let cell = EntryCell()
        cell.yearLabel = yearLabel
        cell.totalUsageLabel = totalUsageLabel
        cell.rightImageView = rightImageView
        cell.set(entry: entry)
        
        XCTAssertTrue(cell.yearLabel.text == "2008")
        XCTAssertTrue(cell.totalUsageLabel.text == entry.getYearlyUsageAmount())
        XCTAssertTrue(cell.rightImageView.isHidden == !entry.hasQuarterlyDecrease())
    }

}
