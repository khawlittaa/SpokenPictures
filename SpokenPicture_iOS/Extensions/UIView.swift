//
//  UIView.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/14/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setBackgrouudImage(imageName: String){
        let image = UIImage(named: imageName)
        let backgroundColor = UIColor(patternImage: image!)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 10 
    }
    
    func addViewShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 1
    }
    
}

