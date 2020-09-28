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
//        let pages = AlbumPagesViewModelItem()
//        album.append(pages)
    }
}
