//
//  ShowcaseCollectionViewController.swift
//  HandCode-Analytics
//
//  Created by Andre Faruolo on 01/02/2018.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShowcaseCollectionViewController: UICollectionViewController {
    var selectedProduct: Product?
    var dataSource = ShowcaseCollectionViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        //
        self.setup()
        self.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Functions
    // MARK: Private
    private func setup(){
        self.collectionView?.dataSource = self.dataSource
        
        if let flowCollectionLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            let baseValueLayout = self.view.bounds.width
            flowCollectionLayout.itemSize = CGSize(width: baseValueLayout*0.4, height: baseValueLayout*0.4)
            
            flowCollectionLayout.minimumLineSpacing = baseValueLayout*0.1
            
            flowCollectionLayout.sectionInset = UIEdgeInsets(
                top: baseValueLayout*0.05,
                left: baseValueLayout*0.05,
                bottom: baseValueLayout*0.05,
                right: baseValueLayout*0.05
            )
            
            flowCollectionLayout.scrollDirection = .vertical
        }
        
        if let collectionViewVerified = self.collectionView {
            collectionViewVerified.dataSource = self.dataSource
            collectionViewVerified.delegate = self
        }
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ShowcaseCollectionViewController.loadData), for: .valueChanged)
        self.collectionView?.refreshControl = refreshControl
        
    }
    
    @objc private func loadData(){
        do {
            try ProductManager.shared.getProduct { (productList) in
                self.dataSource.load(productList: productList)
                self.collectionView?.reloadData()
            }
        }catch{
            print(error)
            
        }
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: Event name:Visualized_Product - attribute[product_id:product.id,product_name:product.name,product_price:product.price]
        self.selectedProduct = self.dataSource.productList[indexPath.row]
        self.performSegue(withIdentifier: "toProductDetail", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProductDetail" {
            if let view = (segue.destination as? ProductDetailTableViewController), let selectedProduct = self.selectedProduct {
                view.product = selectedProduct
            }
        }
    }
    

}
