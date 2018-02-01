//
//  ShoppingCart.swift
//  HandCode-Analytics
//
//  Created by Andre Faruolo on 01/02/2018.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import Foundation

public class ShoppingCart {
    
    public static let shared = ShoppingCart()
    
    var products = [Product]()
    
    func remove(_ product: Product, completion: @escaping () -> Void) {
        self.products = products.filter({ $0 != product })
        completion()
    }
    
    func add(_ product: Product, completion: @escaping () -> Void) {
        self.products.append(product)
        completion()
    }
    
    func clear(completion: @escaping () -> Void){
        self.products = []
        completion()
    }
}
