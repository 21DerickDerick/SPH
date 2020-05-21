//
//  AppCoordinator.swift
//  SPH
//
//  Created by Derick on 21/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    static let shared = ApplicationCoordinator()
    
    let window: UIWindow
    let rootViewController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        rootViewController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        showDataUsageList()
    }
}

extension ApplicationCoordinator {
    func showDataUsageList() {
        removeAllChildCoordinator()
        let dataUsageListCoordinator = DateUsageListCoordinator(presenter: rootViewController, window: window)
        appendChildCoordinator(dataUsageListCoordinator)
        dataUsageListCoordinator.parentCoordinator = self
        dataUsageListCoordinator.start()
    }
}
