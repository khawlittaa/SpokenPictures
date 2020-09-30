//
//  OrdersViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/29/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

class OrdersViewModel {
    
    var orders: [Order] = [Order]()
    
    init() {
        let order = Order(coverColor: .accentAccent31Main)
        orders.append(order)
        let order1 = Order(coverColor: .white)
        orders.append(order1)
    }
}
