//
//  AdminTableViewCell.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/17/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit

class AdminTableViewCell: UITableViewCell {

    @IBOutlet weak var signalLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
