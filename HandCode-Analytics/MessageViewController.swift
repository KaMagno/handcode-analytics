//
//  MessageViewController.swift
//  HandCode-Analytics
//
//  Created by Kaique Magno Dos Santos on 02/02/18.
//  Copyright © 2018 MackMobile. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    @IBOutlet weak var outletText: UILabel!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.outletText.text = self.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    static func view(with text:String) -> UIView{
        let warningViewController = MessageViewController.init(nibName: "MessageViewController", bundle: Bundle.main)
        warningViewController.text = text
        return warningViewController.view
    }
    
}
