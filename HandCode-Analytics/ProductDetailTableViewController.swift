//
//  ProductDetailTableViewController.swift
//  HandCode-Analytics
//
//  Created by Andre Faruolo on 01/02/2018.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import UIKit

class ProductDetailTableViewController: UITableViewController {
    
    
    @IBOutlet weak var outletImage: UIImageView!
    @IBOutlet weak var outletName: UILabel!
    @IBOutlet weak var outletValue: UILabel!
    @IBOutlet weak var outletDescription: UITextView!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.outletImage.layer.cornerRadius = 15.0
        self.outletImage.clipsToBounds = true
        
        if let productVerified = self.product {
            self.outletName.text = productVerified.name
            self.outletImage.image = productVerified.displayImage
            self.outletDescription.text = productVerified.description
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            self.outletValue.text = numberFormatter.string(from: NSNumber(value:productVerified.price))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //TODO: Analytics - Event:ViewItem | Parameters:[Product_Id]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBuyButton(_ sender: Any) {
        if let product = self.product {
            ShoppingCart.shared.add(product, completion: {
                //TODO: Analytics - Event:Sent_To_Cart | Parameters:[Product_Id]
                self.performSegue(withIdentifier: "toShoppingCart", sender: self)
            })
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
