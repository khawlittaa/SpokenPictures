//
//  AlbumPageLayout4Item.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/17/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

class AlbumPageLayout4Item: AlbumPagesViewModelItem {
    var pageTitle: String = ""
    
    var type: AlbumPagesViewModelItemType{
        return .layout4
    }
    
    var numberPictures: Int{
        return 3
    }
}
