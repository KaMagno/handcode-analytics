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
    var totalValue: Double {
        return self.products.reduce(0, { (result, product) -> Double in
            return result + product.price
        })
    }
    
    func remove(_ product: Product, completion: @escaping () -> Void) {
        self.products = products.filter({ $0 != product })
        completion()
    }
    
    func add(_ product: Product, completion: @escaping () -> Void) {
        if !self.products.contains(product) {
            self.products.append(product)
        }
        completion()
    }
    
    func clear(completion: @escaping () -> Void){
        self.products = []
        completion()
    }
}
