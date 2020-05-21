//
//  DataUsageListCoordinator.swift
//  SPH
//
//  Created by Derick on 21/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import UIKit

class DateUsageListCoordinator: Coordinator {
    let window: UIWindow
    private var presenter: UINavigationController
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    init(presenter: UINavigationController, window: UIWindow) {
        self.window = window
        self.presenter = presenter
    }
    
    func start() {
        let vc = DataUsageListVC(nibName: "BaseTableViewController", bundle: nil)
        self.window.rootViewController = presenter
        presenter.pushViewController(vc, animated: false)
    }
}

