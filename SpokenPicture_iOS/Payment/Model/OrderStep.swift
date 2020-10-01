//
//  Order.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 10/1/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation


enum OrderDetails{
    case address
    case item
    case payment
}

class OrderStep {
    var type: OrderDetails
    
    init(type: OrderDetails) {
        self.type = type
    }
}
