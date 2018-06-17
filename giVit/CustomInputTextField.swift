//
//  CustomInputTextField.swift
//  giVit
//
//  Created by Mohammad Al-Ahdal on 2018-06-16.
//  Copyright © 2018 EnggMomo. All rights reserved.
//

import UIKit

class CustomInputTextField : UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.styleTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.styleTextField()
    }
    
    func setupTextField (sender: UIViewController, primaryColor: UIColor, secondaryColor: UIColor) {
        sender.hideKeyboardWhenTappedAround()
    }
    
    func styleTextField(){
        self.backgroundColor = UIColor.clear
        self.tintColor = UIColor.white
        self.textColor = UIColor.white
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder! ,attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        self.borderStyle = UITextBorderStyle(rawValue: 0)!
        
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
