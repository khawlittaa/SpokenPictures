//
//  AlbumPageLayout1Item.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/17/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

class AlbumPageLayout1Item: AlbumPagesViewModelItem {
    var pageTitle: String = ""
    
    var type: AlbumPagesViewModelItemType{
        return .layout1
    }
    
    var numberPictures: Int{
        return 1
    }
}
