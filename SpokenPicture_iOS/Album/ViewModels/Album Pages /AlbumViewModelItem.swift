//
//  AlbumPagesViewModelItemType.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/17/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

enum AlbumSectionViewModelItemType{
    case cover
    case pages
}

protocol AlbumViewModelItem {
    var type: AlbumSectionViewModelItemType{ get }
    var rowCount: Int { get }
}

extension AlbumViewModelItem{
    var rowCount: Int {
         return 1
      }
}
