//
//  ShowcaseCollectionViewDataSource.swift
//  HandCode-Analytics
//
//  Created by Kaique Magno Dos Santos on 01/02/18.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import UIKit

private let reuseIdentifier = "default"

class ShowcaseCollectionViewDataSource:  NSObject,UICollectionViewDataSource {
    
    
//    var productList = [Product]()
    
    override init() {
        super.init()
        
    }
    
//    func load(productList:[Product]){
//        self.productList = productList
//    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
//        return self.productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let reuseCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//        guard let cell = reuseCell as? ProductCollectionViewCell else {
//            Logger.logError(in: self, message: "Error to cast \(reuseCell) to ProductCollectionViewCell ")
//            return UICollectionViewCell()
//        }
//
//        let product = self.productList[indexPath.row]
//
//        cell.outletTitle.text = product.title
//        cell.outletBackground.image = UIImage(data: product.photo! as Data)
//
//        return cell
    }
    
    
}


