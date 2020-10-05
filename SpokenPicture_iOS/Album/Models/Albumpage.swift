//
//  Albumpage.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/28/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

enum AlbumPagesLayout {
    case layout1
    case layout2
    case layout3
    case layout4
    case layout5
    case layout6
}

class AlbumPage{
    
    var pageLayout: AlbumPagesLayout = .layout1
    var pageNumber: Int = 1
    var numberPictures: Int = 1
    var images:[UIImage]?
    
    init(pageLayout: AlbumPagesLayout, pageNumber: Int, numberPictures: Int) {
        self.pageLayout = pageLayout
        self.pageNumber = pageNumber
        self.numberPictures = numberPictures
        self.images = [UIImage]()
    }
}
