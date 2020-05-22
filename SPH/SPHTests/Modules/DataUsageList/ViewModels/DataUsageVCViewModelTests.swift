//
//  DataUsageVCViewModelTests.swift
//  SPHTests
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import XCTest
import Alamofire
@testable import SPH

class MockSuccessDataUsageListProvider: DataUsageListProviderProtocol {
    func getDataUsageList(completion: @escaping ([Record]?, AFError?) -> Void) {
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
        
        completion(records, nil)
    }
}

class MockInvalidURLErrorDataUsageListProvider: DataUsageListProviderProtocol {
    func getDataUsageList(completion: @escaping ([Record]?, AFError?) -> Void) {
        
        let error: AFError = .invalidURL(url: "test1234")
        completion(nil, error)
    }
}

class DataUsageVCViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetDataUsageList() {
        let viewModel = DataUsageVCViewModel(dataUsageListProvider: DataUsageListProvider())
        XCTAssertTrue(viewModel.entries.count == 0)
        viewModel.getDataUsageList(dataUsageListProvider: MockSuccessDataUsageListProvider()) {
            XCTAssertTrue(viewModel.entries.count == 4)
        }
    }
    
    func testGetCorrectRecordsBetweenYear2009to2010() {
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
        
        let viewModel = DataUsageVCViewModel(dataUsageListProvider: DataUsageListProvider())
        let filteredRecords = viewModel.getRecordsBetween(records: records, betweenYear: 2009, toYear: 2010)
        
        assert(filteredRecords.count == 8)
    }
    
    func testGetIncorrectRecordsBetweenYear2008to2010() {
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
        
        let viewModel = DataUsageVCViewModel(dataUsageListProvider: DataUsageListProvider())
        let filteredRecords = viewModel.getRecordsBetween(records: records, betweenYear: 2008, toYear: 2010)
        
        XCTAssertFalse(filteredRecords.count == 8)
    }
    
    func testGetRecordsIncorrectData() {
        let recordY08Q1 = Record(volumeOfMobileData: "0.171586", quarter: "200a8-Q1", id: 15)
        let recordY08Q2 = Record(volumeOfMobileData: "0.248899", quarter: "200a8-Q2", id: 16)
        let recordY08Q3 = Record(volumeOfMobileData: "0.439655", quarter: "200a8-Q3", id: 17)
        let recordY08Q4 = Record(volumeOfMobileData: "0.683579", quarter: "200a8-Q4", id: 18)
        
        let recordY09Q1 = Record(volumeOfMobileData: "0.171586", quarter: "200a9-Q1", id: 15)
        let recordY09Q2 = Record(volumeOfMobileData: "0.248899", quarter: "200a9-Q2", id: 16)
        let recordY09Q3 = Record(volumeOfMobileData: "0.439655", quarter: "200a9-Q3", id: 17)
        let recordY09Q4 = Record(volumeOfMobileData: "0.683579", quarter: "200a9-Q4", id: 18)
        
        let recordY10Q1 = Record(volumeOfMobileData: "0.171586", quarter: "201a0-Q1", id: 15)
        let recordY10Q2 = Record(volumeOfMobileData: "0.248899", quarter: "201a0-Q2", id: 16)
        let recordY10Q3 = Record(volumeOfMobileData: "0.439655", quarter: "201a0-Q3", id: 17)
        let recordY10Q4 = Record(volumeOfMobileData: "0.683579", quarter: "201a0-Q4", id: 18)
        
        let recordY11Q1 = Record(volumeOfMobileData: "0.171586", quarter: "201a1-Q1", id: 15)
        let recordY11Q2 = Record(volumeOfMobileData: "0.248899", quarter: "201a1-Q2", id: 16)
        let recordY11Q3 = Record(volumeOfMobileData: "0.439655", quarter: "201a1-Q3", id: 17)
        let recordY11Q4 = Record(volumeOfMobileData: "0.683579", quarter: "201a1-Q4", id: 18)

        let records = [
            recordY08Q1, recordY08Q2, recordY08Q3, recordY08Q4,
            recordY09Q1, recordY09Q2, recordY09Q3, recordY09Q4,
            recordY10Q1, recordY10Q2, recordY10Q3, recordY10Q4,
            recordY11Q1, recordY11Q2, recordY11Q3, recordY11Q4
        ]
        
        let viewModel = DataUsageVCViewModel(dataUsageListProvider: DataUsageListProvider())
        let filteredRecords = viewModel.getRecordsBetween(records: records, betweenYear: 2008, toYear: 2010)
        
        XCTAssertTrue(filteredRecords.count == 0)
    }
    
    
    func testConvertRecordsToEntries() {
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
        
        let viewModel = DataUsageVCViewModel(dataUsageListProvider: DataUsageListProvider())
        let entries = viewModel.convertRecordsToYearlyEntry(records: records)
        
        XCTAssertTrue(entries.count == 4)
    }
}
