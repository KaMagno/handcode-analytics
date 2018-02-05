//
//  SignUpTableViewController.swift
//  HandCode-Analytics
//
//  Created by Andre Faruolo on 01/02/2018.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import UIKit

class SignUpTableViewController: UITableViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordConfirmField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressCancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didPressDoneButton(_ sender: Any) {
        self.signUp { (error) in
            if error == nil {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func signUp(completion: @escaping (Error?) -> Void) {
        guard let email = self.emailField.text, let password = self.passwordField.text, let passwordConfirm = self.passwordConfirmField.text else {
            completion(Failure.failedToGetFields)
            return
        }
        
        if password == passwordConfirm {
            ServerManager.shared.SignUp(email: email, password: password) { (error) in
                //TODO: Analytics - Event:SignUp
                completion(error)
            }
        } else {
            //FIXME:
        }
    }
}
