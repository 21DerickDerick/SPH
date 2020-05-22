//
//  DataUsageListVC.swift
//  SPH
//
//  Created by Derick on 21/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import UIKit

class DataUsageListVC: BaseTableViewController {
    
    let viewModel = DataUsageVCViewModel(dataUsageListProvider: DataUsageListProvider())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dataUsageListProvider = viewModel.dataUsageListProvider else { return }
        
        viewModel.getDataUsageList(dataUsageListProvider: dataUsageListProvider) {
            self.tableView.reloadData()
        }
    }
    
    override func setupUI() {
        super.setupUI()
        
        title = "Mobile Data Usage"
    }
    
    override func registerNIB() {
        super.registerNIB()
        
        [EntryCell.self].forEach { (type) in
            tableView.register(UINib(nibName: String(describing: type), bundle: nil), forCellReuseIdentifier: String(describing: type))
        }
    }
}

extension DataUsageListVC {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 14
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 14
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EntryCell.self), for: indexPath) as! EntryCell
        
        let entry = viewModel.entries[indexPath.row]
        cell.set(entry: entry)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DataUsageListVC: EntryCellDelegate {
    func didTapRightImageView(year: String) {
        AlertWireframe.shared.showHasQuarterlyDataUsageDecreaseAlert(inViewController: self, inYear: year)
    }
}
