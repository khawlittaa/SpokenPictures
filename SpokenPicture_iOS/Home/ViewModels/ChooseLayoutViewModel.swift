//
//  ChooseLayoutViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

class ChooseLayoutViewModel{
    
    var layouts: [Layout] = [Layout]()
    
    init() {
        let layout1 = Layout(layoutImage: "layout1", isPremium: false)
        self.layouts.append(layout1)
        let layout2 = Layout(layoutImage: "layout2", isPremium: false)
        self.layouts.append(layout2)
        let layout3 = Layout(layoutImage: "layout3", isPremium: false)
        self.layouts.append(layout3)
        let layout4 = Layout(layoutImage: "layout4", isPremium: false)
        self.layouts.append(layout4)
        let layout5 = Layout(layoutImage: "layout5", isPremium: true)
        self.layouts.append(layout5)
        let layout6 = Layout(layoutImage: "layout6", isPremium: true)
        self.layouts.append(layout6)
    }
    
}
