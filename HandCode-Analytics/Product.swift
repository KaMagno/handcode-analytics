//
//  Product.swift
//  HandCode-Analytics
//
//  Created by Andre Faruolo on 01/02/2018.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import Foundation
import UIKit

public class Product {
    
    var id : Int
    var name : String
    var description : String
    var price : Double
    var displayImage : UIImage
    
    init(id: Int, name: String, description: String, price : Double, displayImage : UIImage){
        
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.displayImage = displayImage
        
    }
    
}

extension Product: Equatable {
    public static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}
