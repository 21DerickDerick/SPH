//
//  EntryCell.swift
//  SPH
//
//  Created by Derick on 21/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import UIKit

protocol EntryCellDelegate: class {
    func didTapRightImageView(year: String)
}

class EntryCell: BaseTableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var totalUsageLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    weak var delegate: EntryCellDelegate?
    var entry: Entry?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialUISetup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func initialUISetup() {
        cardView.backgroundColor = .mainBlue
        cardView.layer.cornerRadius = 4
        
        yearLabel.textColor = .lightBlue
        yearLabel.font = .tertiary
        
        totalUsageLabel.textColor = .white
        totalUsageLabel.font = .secondary
        
        rightImageView.addGestureRecognizer(
            UITapGestureRecognizer.init(target: self, action:#selector(didTapRightImageView))
        )

        rightImageView.isUserInteractionEnabled = true
    }
    
    func set(entry: Entry) {
        yearLabel.text = entry.year
        totalUsageLabel.text = entry.getYearlyUsageAmount()
        rightImageView.isHidden = !entry.hasQuarterlyDecrease()
        
        self.entry = entry
        
        if isRunningTests {
            setupTest()
        }
    }
    
    @objc func didTapRightImageView() {
        guard let year = entry?.year else { return }
        
        delegate?.didTapRightImageView(year: year)
    }
    
    func setupTest() {
        guard let year = entry?.year else { return }
        
        self.accessibilityIdentifier = "\(year)entryCell"
        yearLabel.accessibilityIdentifier = "\(year)yearLabel"
        totalUsageLabel.accessibilityIdentifier = "\(year)totalUsageLabel"
        rightImageView.accessibilityIdentifier = "\(year)rightImageView"
        cardView.accessibilityIdentifier = "\(year)cardView"
    }
}
