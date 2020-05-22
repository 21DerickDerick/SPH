//
//  DataUsageVCViewModel.swift
//  SPH
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import Foundation

class DataUsageVCViewModel {
    var dataUsageListProvider: DataUsageListProvider?
    var entries: [Entry] = []
 
    init(dataUsageListProvider: DataUsageListProvider) {
        self.dataUsageListProvider = dataUsageListProvider
    }
    
    func getDataUsageList(completion: @escaping () -> Void) {
        guard let dataUsageListProvider = dataUsageListProvider else { return }
        
        dataUsageListProvider.getDataUsageList { (records, error) in
            if let _ = error {
                return
            }
            
            guard let records = records else { return }
            
            let filteredRecords = self.getRecordsBetween(records: records, betweenYear: 2008, toYear: 2018)
            self.entries = self.convertRecordsToYearlyEntry(records: filteredRecords)
            
            completion()
        }
    }
    
    func getRecordsBetween(records: [Record], betweenYear startYear: Int, toYear endYear: Int) -> [Record] {
        let filteredRecords = records.filter {
            let yearString = $0.quarter.prefix(4)
            if let yearInt = Int(yearString) {
                return yearInt >= startYear && yearInt <= endYear
            } else {
                return false
            }
        }
        
        return filteredRecords
    }
    
    func convertRecordsToYearlyEntry(records: [Record]) -> [Entry] {
        var i = 0
        var entries: [Entry] = []
        
        while i < records.count {
            let newEntry = Entry()
            newEntry.year = String(records[i].quarter.prefix(4))
            
            while newEntry.records.count < 4 && i < records.count {
                newEntry.records.append(records[i])
                i += 1
            }
            
            entries.append(newEntry)
        }
        
        return entries.reversed()
    }
}
