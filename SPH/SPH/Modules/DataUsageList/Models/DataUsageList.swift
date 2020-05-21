//
//  DataUsageList.swift
//  SPH
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import Foundation

class DataUsageList: Codable {
    let resourceID: String?
    let fields: [Field]?
    let records: [Record]?
    let links: Links?
    let limit, total: Int?

    enum CodingKeys: String, CodingKey {
        case resourceID = "resource_id"
        case fields, records
        case links = "_links"
        case limit, total
    }
}

class Field: Codable {
    let type, id: String
}

class Links: Codable {
    let start, next: String
}

class Record: Codable {
    let volumeOfMobileData, quarter: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case volumeOfMobileData = "volume_of_mobile_data"
        case quarter
        case id = "_id"
    }
}
