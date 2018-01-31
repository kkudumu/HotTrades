//
//  FreeUserTableViewCell.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/29/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit

class FreeUserTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var signalLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        addSubview(postImageView)
        
        postImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        postImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        postImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
