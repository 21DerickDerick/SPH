//
//  E.swift
//  SPH
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import Foundation

class Entry {
    var year: String = ""
    var records: [Record] = []
    
    func getYearlyUsageAmount() -> String {
        var total: Float = 0
        for record in records {
            if let dataUsage = Float(record.volumeOfMobileData) {
                total += dataUsage
            }
        }
        
        return "\(String(total)) PB"
    }
}
