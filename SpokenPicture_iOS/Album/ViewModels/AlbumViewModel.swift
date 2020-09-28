//
//  CreateAlbumViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/17/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

class AlbumViewModel {
    
    var album: [AlbumViewModelItem] = [AlbumViewModelItem] ()
    
    init() {
        let cover = AlbumCoverViewModelItem()
        album.append(cover)
        let pages = AlbumPagesViewModelItem()
        let page = AlbumPage(pageLayout: .layout5 , pageNumber: 1, numberPictures: 3)
        pages.albumPages.append(page)
        album.append(pages)
        
    }
}
