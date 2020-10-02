//
//  OrderDetailsViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 10/1/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation


class OrderDetailsViewModel{
    
    var odrerItems: [OrderStep] = [OrderStep]()
    
    init() {
        let album = OrderStep(type: .item)
        let adr = OrderStep(type: .address)
        let card = OrderStep(type: .payment)
        odrerItems.append(album)
        odrerItems.append(adr)
        odrerItems.append(card)
    }
}
