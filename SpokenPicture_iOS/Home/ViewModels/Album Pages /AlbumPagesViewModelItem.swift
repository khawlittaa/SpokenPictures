//
//  AlbumPagesViewModelItemType.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/17/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

enum AlbumPagesViewModelItemType {
    case layout1
    case layout2
    case layout3
    case layout4
    case layout5
    case layout6
}

protocol AlbumPagesViewModelItem {
    var type: AlbumPagesViewModelItemType { get }
    var pageTitle: String  { get  set }
    var numberPictures: Int { get }
}

extension AlbumPagesViewModelItem{
    var pageTitle: String {
        return "Page 1"
    }
}
