//
//  CheckoutTableViewController.swift
//  HandCode-Analytics
//
//  Created by Andre Faruolo on 01/02/2018.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import UIKit

class CheckoutTableViewController: UITableViewController {
    var paymentMethod: PaymentMethod?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.paymentMethod = .Debit
        default:
            self.paymentMethod = .Credit
        }
        
        self.checkOut { (error) in
            if error == nil {
                self.performSegue(withIdentifier: "toAccomplishedPurchase", sender: self)
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func checkOut(completion: @escaping (Error?) -> Void) {
        guard let method = self.paymentMethod else {
            completion(Failure.failedToGetFields)
            return
        }
        
        ServerManager.shared.CompletePurchase(method: method) { (error) in
            //TODO: Analytics
            
            ShoppingCart.shared.clear {
                completion(error)
            }
        }
    }
}

enum PaymentMethod {
    case Debit
    case Credit
}
