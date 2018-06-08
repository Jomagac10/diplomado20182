//
//  ItemCell.swift
//  Homepwner
//
//  Created by Jose Manuel García Chávez on 6/8/18.
//  Copyright © 2018 Jose Manuel García Chávez. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell{
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
}
