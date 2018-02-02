//
//  ShoppingCartTableViewCell.swift
//  HandCode-Analytics
//
//  Created by Julio Brazil on 02/02/18.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
