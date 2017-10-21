//
//  ContactInfoCellTableViewCell.swift
//  telegram
//
//  Created by Mohammed S A Kwaik on 10/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

class ContactInfoCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var ContactName: UILabel!
    @IBOutlet weak var ContactStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
