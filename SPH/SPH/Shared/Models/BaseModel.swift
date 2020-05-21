//
//  BaseModel.swift
//  SPH
//
//  Created by Derick on 21/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import Foundation

struct BaseModel<T: Codable>: Codable {
    let help: String?
    let success: Bool?
    let result: T?
}
