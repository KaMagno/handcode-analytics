//
//  SignInTableViewController.swift
//  HandCode-Analytics
//
//  Created by Andre Faruolo on 01/02/2018.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import UIKit

class SignInTableViewController: UITableViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressLogInButton(_ sender: Any) {
        self.login { (error) in
            if error == nil {
                self.performSegue(withIdentifier: "toShowcase", sender: self)
            }
        }
    }
    
    func login(completion: @escaping (Error?) -> Void) {
        guard let email = self.emailField.text, let password = self.passwordField.text else {
            completion(Failure.failedToGetFields)
            return
        }
        
        ServerManager.shared.SignIn(email: email, password: password) { (error) in
            //TODO: Analytics
            completion(error)
        }
    }
}
