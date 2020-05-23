//
//  BaseTableViewController.swift
//  SPH
//
//  Created by Derick on 21/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import UIKit

class BaseTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
     let spinnerVC = SpinnerVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        registerNIB()
        setupUI()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
    }
    
    func registerNIB() {

    }
    
    func setupUI() {
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.mainBlue,
            NSAttributedString.Key.font: UIFont.main,
        ]
        
        navigationController?.navigationBar.setBackgroundImage(UIColor.clear.as1ptImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIColor.lightBlue.as1ptImage()
    }
    
    func showLoadingIndicator() {
        guard let currentViewFrame = ApplicationCoordinator.shared.window.rootViewController?.view.frame else { return }
        
        addChild(spinnerVC)
        spinnerVC.view.frame = currentViewFrame
        tableView.addSubview(spinnerVC.view)
        spinnerVC.didMove(toParent: self)
    }
    
    func hideLoadingIndicator() {
        spinnerVC.willMove(toParent: nil)
        spinnerVC.view.removeFromSuperview()
        spinnerVC.removeFromParent()
    }
}

extension BaseTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

