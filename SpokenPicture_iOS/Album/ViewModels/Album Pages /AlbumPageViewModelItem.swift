//
//  AlbumPageSectionViewModelItem.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/28/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation
class AlbumPagesViewModelItem: AlbumViewModelItem{
    var type: AlbumSectionViewModelItemType{
        return .pages
    }
    
    var albumPage: AlbumPage?
    
}
