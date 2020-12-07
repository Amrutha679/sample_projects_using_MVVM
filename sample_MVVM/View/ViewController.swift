//
//  ViewController.swift
//  sample_MVVM
//
//  Created by amrutha on 07/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var alertLabel: UILabel!
    
    var authenticationVM = AuthenticationVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alertLabel.isHidden = true
    }

    @IBAction func loginButton(_ sender: Any) {
        self.alertLabel.isHidden = true
        guard let userName = self.username.text else{return}
        guard let pwd = self.password.text  else {return}
        
        authenticationVM.authenticateUserWith(userName, pwd)
        authenticationVM.loginCompletionHandler{(status,message) in
            if status{
                self.alertLabel.text = "Logged in with username == \(self.authenticationVM.user.username) and email == \(self.authenticationVM.user.email)"
                self.alertLabel.isHidden = false
            } else {
                self.alertLabel.text = message
                self.alertLabel.isHidden = false
            }
        }
    }
}

