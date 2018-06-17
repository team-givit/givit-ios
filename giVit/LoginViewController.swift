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
    
    @IBOutlet weak var LoginButton: CustomFullWidthButton!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(hex: 0x454545)
        print(self.LoginButton.frame.minY)
        self.LoginButton.setupButton(
            sender: self,
            y: self.LoginButton.frame.minY,
            height: 66,
            color: UIColor(hex: 0xE0E0CE),
            onPress:
            {
                [unowned self] in
                print("Button Level 1")
                Auth.auth().signIn(
                    withEmail: self.emailTextField.text!,
                    password: self.passwordTextField.text!,
                    completion: {(user, error) in
                        print("Button Level 2")
                        print(user)
                        print(error)
                })
        })
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
}
