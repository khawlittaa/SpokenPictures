//
//  UIButton.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/11/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

extension UIButton{
    
    var isValid: Bool {
        get {
            return isEnabled && backgroundColor == .accentAccent31Main
        }
        set {
            backgroundColor = newValue ? .accentAccent31Main : .grey3Disabled
            isEnabled = newValue
        }
    }
    
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        //NSAttributedStringKey.foregroundColor : UIColor.blue
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    func roundEdges(){
        self.layer.cornerRadius = 23
        self.clipsToBounds = true
    }
    
    func setSkipButtonAppearance(){
        self.titleLabel?.textColor = .grey1Main
        self.underline()
    }
    
    func selectedRadioButton(){
        let bgImage = UIImage(named: "coverColorSelection")
        self.setBackgroundImage(bgImage, for: .normal)
    }
    
    func addButtonShadow(){
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 4.0
    }
}
