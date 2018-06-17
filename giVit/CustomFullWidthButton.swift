//
//  CustomFullWidthButton.swift
//  giVit
//
//  Created by Mohammad Al-Ahdal on 2018-06-16.
//  Copyright © 2018 EnggMomo. All rights reserved.
//

import UIKit

class CustomFullWidthButton : UIButton {
    var onPress: (()->Void)?
    
    
    func setupButton (sender: UIViewController, y: CGFloat, height: CGFloat = 66, color: UIColor = UIColor(hex: 0x454545), onPress: @escaping ()->Void) {
        self.frame = CGRect(x: sender.view.frame.width/10, y: y, width: sender.view.frame.width*8/10, height: height)
        self.backgroundColor = color
        self.onPress = onPress
        self.addTarget(self, action: #selector(CustomFullWidthButton.clicked), for: .touchUpInside)
        self.layer.cornerRadius = 8
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor(hex: 0x000000).cgColor
        self.layer.shadowOpacity = 0.25
        self.tintColor = UIColor(hex: 0x454545)
    }
    
    
    @objc func clicked() {
        onPress?()
    }
    
    
}
