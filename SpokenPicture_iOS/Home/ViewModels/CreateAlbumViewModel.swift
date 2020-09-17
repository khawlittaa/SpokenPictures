//
//  CreateAlbumViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/17/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

class CreateAlbumViewModel {
    
    var pages:[AlbumPagesViewModelItem] = [AlbumPagesViewModelItem] ()
    
    init() {
        let page = AlbumPageLayout1Item()
        pages.append(page)
    }
}
