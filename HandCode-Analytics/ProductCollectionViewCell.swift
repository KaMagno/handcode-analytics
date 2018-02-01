//
//  ProductCollectionViewCell.swift
//  HandCode-Analytics
//
//  Created by Kaique Magno Dos Santos on 01/02/18.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var outletBackground: UIImageView!
    @IBOutlet weak var outletTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 15.0
        self.contentView.clipsToBounds = true
    }
}
