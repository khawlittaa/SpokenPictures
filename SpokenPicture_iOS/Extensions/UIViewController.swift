//
//  UIViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/12/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func setBackgrouudImage(imageName: String){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: imageName)
        backgroundImage.contentMode =  UIView.ContentMode.scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
}
