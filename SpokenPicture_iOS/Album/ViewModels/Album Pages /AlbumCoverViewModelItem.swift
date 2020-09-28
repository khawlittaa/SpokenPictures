//
//  AlbumCoverViewModelItem.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/28/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

class AlbumCoverViewModelItem: AlbumViewModelItem{
    var type: AlbumSectionViewModelItemType{
        return .cover
    }
    
    var albumtitle: String = ""
    var albumCreationDate: String = ""
    var coverImageURl: String = ""
    
    
}
