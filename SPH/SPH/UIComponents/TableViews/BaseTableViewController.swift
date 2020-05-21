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

