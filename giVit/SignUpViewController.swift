//
//  SignUpViewController.swift
//  giVit
//
//  Created by Mohammad Al-Ahdal on 2018-06-17.
//  Copyright © 2018 EnggMomo. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController : UIViewController {
    @IBOutlet weak var SignUpButton: CustomFullWidthButton!
    @IBOutlet weak var emailTextField: CustomInputTextField!
    @IBOutlet weak var passwordTextField: CustomInputTextField!
    
    override func viewDidLoad() {
        self.styleView()
        self.addFunctionality()
    }
    
    func styleView() {
        self.view.backgroundColor = UIColor(hex: 0xFFDE00)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= (keyboardSize.height-(self.view.frame.height-SignUpButton.frame.maxY-10)).rounded()
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y = 0
            }
        }
    }
    
    func addFunctionality() {
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.SignUpButton.setupButton(
            sender: self,
            y: self.SignUpButton.frame.minY,
            height: 66,
            color: UIColor(hex: 0xE0E0CE),
            onPress:
            {
                [unowned self] in
                print("Button Level 1")
                Auth.auth().createUser(
                    withEmail: self.emailTextField.text!,
                    password: self.passwordTextField.text!,
                    completion:
                    {
                        (user, error) in
                        print("Button Level 2")
                        print(user)
                        print(error)
                }
                )
            }
        )
    }
    
}
