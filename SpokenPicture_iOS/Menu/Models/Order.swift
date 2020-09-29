//
//  Order.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/29/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation
import UIKit

class Order{
    var coverImage: UIImage?
    var  title: String = ""
    var creationDate: String = ""
    var orderDate: String = ""
    var coverColor: UIColor = .white
    var numberPages: Int = 1
    
    init(coverColor: UIColor) {
        self.coverColor = coverColor
    }
}
