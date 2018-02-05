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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    // MARK: - Functions
    func checkOut(completion: @escaping (Error?) -> Void) {
        guard let method = self.paymentMethod else {
            completion(Failure.failedToGetFields)
            return
        }
        
        ServerManager.shared.CompletePurchase(method: method) { (error) in
            //TODO: Analytics - Event:Purchase_Completed
            
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
