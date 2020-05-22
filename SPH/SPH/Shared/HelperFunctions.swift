//
//  HelperFunctions.swift
//  SPH
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import Foundation

var isRunningTests: Bool {
    let environment = ProcessInfo().environment
    if let isRunningUITest = environment["isRunningUITest"] {
        return isRunningUITest == "1"
    } else {
        return false
    }
}
