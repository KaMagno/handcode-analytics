//
//  ShoppingCartTableViewController.swift
//  HandCode-Analytics
//
//  Created by Andre Faruolo on 01/02/2018.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingCartTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         self.clearsSelectionOnViewWillAppear = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.changeFooterView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressBackButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Functions
    // MARK: Private
    private func changeFooterView(){
        if ShoppingCart.shared.products.count == 0 {
            self.tableView.tableFooterView = MessageViewController.view(with: "Você ainda não fez nenhuma doação 😢")
        }else{
            self.tableView.tableFooterView = UIView()
        }
    }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingCart.shared.products.count
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //TODO: Analytics - Event:Product_Removed | Parameters:[Product_Id]
            ShoppingCart.shared.products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.changeFooterView()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ShoppingCartTableViewCell
        let product = ShoppingCart.shared.products[indexPath.row]
        
        cell.productName.text = product.name
        cell.productPrice.text = "R$ \(product.price)"
        
        return cell
    }
}
