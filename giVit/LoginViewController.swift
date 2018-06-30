//
//  LoginViewController.swift
//  giVit
//
//  Created by Mohammad Al-Ahdal on 2018-06-09.
//  Copyright © 2018 EnggMomo. All rights reserved.
//

import UIKit
import Firebase
import YYKeyboardManager

class LoginViewController : UIViewController, YYKeyboardObserver {
    @IBOutlet weak var LoginButton: CustomFullWidthButton!
    @IBOutlet weak var emailTextField: CustomInputTextField!
    @IBOutlet weak var passwordTextField: CustomInputTextField!
    
    var diff : CGFloat = 0
    
    override func viewDidLoad() {
        self.styleView()
        self.addFunctionality()
    }
    
    
    func keyboardChanged(with transition: YYKeyboardTransition) {
        let toFrame: CGRect = manager.convert(transition.toFrame, to: self.view)
        let animationDuration: TimeInterval = transition.animationDuration
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: [], animations: {
            () in
            let bottomMostPoint = self.LoginButton.frame.maxY + 20 // set padding
            if (bottomMostPoint > toFrame.origin.y) {
                self.diff = toFrame.origin.y - bottomMostPoint
                self.LoginButton.frame.origin.y += self.diff
                self.emailTextField.frame.origin.y += self.diff
                self.passwordTextField.frame.origin.y += self.diff
            } else {
                self.LoginButton.frame.origin.y -= self.diff
                self.emailTextField.frame.origin.y -= self.diff
                self.passwordTextField.frame.origin.y -= self.diff
            }
        })
    }
    
    func styleView(){
        self.view.backgroundColor = UIColor(hex: 0x454545)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func addFunctionality(){
        keyFrame = manager.convert(keyFrame, to: self.view)
        manager.add(self)
        self.hideKeyboardWhenTappedAround()
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
