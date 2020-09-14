//
//  UICollectionView.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/14/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView{
    
    func registerCell(nib: String, cellreuseIdentifier: String) {
         let cell = UINib(nibName: nib, bundle: nil)
        self.register(cell, forCellWithReuseIdentifier: cellreuseIdentifier)
     }
}
