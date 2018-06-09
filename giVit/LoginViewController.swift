//
//  LoginViewController.swift
//  giVit
//
//  Created by Mohammad Al-Ahdal on 2018-06-09.
//  Copyright © 2018 EnggMomo. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController : UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        /*Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user, error) in
            print(user)
            print(error)
            print("probably logged in")
        })*/
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user, error) in
            print(user)
            print(error)
            print("probably logged in")
        })
        
    }
    
}
