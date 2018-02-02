//
//  ServerManager.swift
//  HandCode-Analytics
//
//  Created by Julio Brazil on 02/02/18.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import Foundation

public class ServerManager {
    public static var shared = ServerManager()
    
    func SignUp(email: String, password: String, completion: @escaping (Error?) -> Void ) {
        print("cadastro")
        completion(nil)
    }
    
    func SignIn(email: String, password: String, completion: @escaping (Error?) -> Void ) {
        print("login")
        completion(nil)
    }
    
    func CompletePurchase(method: PaymentMethod, completion: @escaping (Error?) -> Void) {
        print("compra efetuada")
        completion(nil)
    }
}

enum Failure: Error {
    case cannotReachServer
    case failedToGetFields
}
