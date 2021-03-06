//
//  SignUpViewController.swift
//  giVit
//
//  Created by Mohammad Al-Ahdal on 2018-06-17.
//  Copyright © 2018 EnggMomo. All rights reserved.
//

import UIKit
import Firebase
import YYKeyboardManager

var manager = YYKeyboardManager.default()
var keyView = manager.keyboardView
var keyWindow = manager.keyboardWindow
var keyVis = manager.isKeyboardVisible
var keyFrame = manager.keyboardFrame



class SignUpViewController : UIViewController, YYKeyboardObserver {
    @IBOutlet weak var SignUpButton: CustomFullWidthButton!
    @IBOutlet weak var emailTextField: CustomInputTextField!
    @IBOutlet weak var passwordTextField: CustomInputTextField!

    var diff : CGFloat = 0
    
    override func viewDidLoad() {
        self.styleView()
        self.addFunctionality()
        
        keyFrame = manager.convert(keyFrame, to: self.view)
        manager.add(self)
    }
    
    func keyboardChanged(with transition: YYKeyboardTransition) {
        let fromFrame: CGRect = manager.convert(transition.fromFrame, to: self.view)
        let toFrame: CGRect = manager.convert(transition.toFrame, to: self.view)
        let fromVisible: Bool = transition.fromVisible.boolValue
        let toVisible: Bool = transition.toVisible.boolValue
        let animationDuration: TimeInterval = transition.animationDuration
        let curve: UIViewAnimationCurve = transition.animationCurve
        
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: [], animations: {
            () in
            let bottomMostPoint = self.SignUpButton.frame.maxY + 20 // set padding
            if (bottomMostPoint > toFrame.origin.y) {
                self.diff = toFrame.origin.y - bottomMostPoint
                self.SignUpButton.frame.origin.y += self.diff
                self.emailTextField.frame.origin.y += self.diff
                self.passwordTextField.frame.origin.y += self.diff
            } else {
                self.SignUpButton.frame.origin.y -= self.diff
                self.emailTextField.frame.origin.y -= self.diff
                self.passwordTextField.frame.origin.y -= self.diff
            }
        })
        print("fromFrame: \(fromFrame),\ntoFrame: \(toFrame),\nfromVisible: \(fromVisible),\ntoVisible: \(toVisible),\nanimationDuriation: \(animationDuration)\n")
    }
    
    func styleView() {
        self.view.backgroundColor = UIColor(hex: 0xFFDE00)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func addFunctionality() {
        self.hideKeyboardWhenTappedAround()
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
