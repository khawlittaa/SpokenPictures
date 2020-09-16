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
}
