//
//  ProductManager.swift
//  HandCode-Analytics
//
//  Created by Kaique Magno Dos Santos on 02/02/18.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import UIKit

class ProductManagerError: Error {
    
}

class ProductManager: NSObject {
    
    public static let shared = ProductManager()
    
    func getProduct(completion:([Product])->Void) throws {
        var products = [Product]()
       
        let product_1 = Product(id: 0, name: "Zoobumafoo", description: "An really funny animal which wil make you laugh ", price: 100.00, displayImage: #imageLiteral(resourceName: "zoobomafoo"))
        let product_2 = Product(id: 1, name: "Dragon", description: "An old beautiful animal. Responsible for the best histories ", price: 1320.00, displayImage: #imageLiteral(resourceName: "dragons"))
        let product_3 = Product(id: 2, name: "Tenor", description: "Bananaaaaaaaa ... ", price: 3434.00, displayImage: #imageLiteral(resourceName: "minion_tenor"))
        let product_4 = Product(id: 3, name: "Capivara", description: "Please, someone help me to drescribe it 😨", price: 804.00, displayImage: #imageLiteral(resourceName: "capivara"))
        let product_5 = Product(id: 4, name: "Uni Llama", description: "Once upon an time an Unicorn loved a Llama", price: 100.00, displayImage: #imageLiteral(resourceName: "uni_llama"))
        let product_6 = Product(id: 5, name: "Baby Groot", description: "I am Grooootttttttt ... Leave the buttons far away", price: 100.00, displayImage: #imageLiteral(resourceName: "baby_groot"))
        
        products.append(product_1)
        products.append(product_2)
        products.append(product_3)
        products.append(product_4)
        products.append(product_5)
        products.append(product_6)
        
        completion(products)
    }
    
}
