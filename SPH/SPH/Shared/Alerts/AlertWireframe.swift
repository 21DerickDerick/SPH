//
//  AlertWireframe.swift
//  SPH
//
//  Created by Derick on 21/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import UIKit

class AlertWireframe {
    static var shared = AlertWireframe()

    func showOneButtonAlert(_ title: String?, message: String?, actionButton: String, inViewController viewController: UIViewController?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: actionButton, style: .default, handler: nil)
        alertController.addAction(actionButton)
        viewController?.present(alertController, animated: true, completion: nil)
    }

    func showNoInternetConnectionAlert(inViewController vc: UIViewController?) {
        showOneButtonAlert("No Internet Connection", message: "Please check your connection", actionButton: "OK", inViewController: vc)
    }
    
    func showHasQuarterlyDataUsageDecreaseAlert(inViewController vc: UIViewController?, inYear year: String) {
        showOneButtonAlert("Quarterly Decrease in \(year)", message: "There is quarterly decrease in data usage consumption in this year", actionButton: "OK", inViewController: vc)
    }
}
