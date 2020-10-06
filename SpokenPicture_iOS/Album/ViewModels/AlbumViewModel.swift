//
//  CreateAlbumViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/17/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources
import Differentiator

enum TableViewEditingCommand{
    case AppendItem(item: AlbumSectionItem, section: Int)
    case DeleteItem(IndexPath)
}

class AlbumViewModel{
    
    var sections: [AlbumSectionItem]
    
    init(){
        let pages = AlbumPagesViewModelItem()
        let page = AlbumPage(pageLayout: .layout1 , pageNumber: 1, numberPictures: 3)
        pages.albumPage = page
        let pages1 = AlbumPagesViewModelItem()
        let pagge1 = AlbumPage(pageLayout: .layout2, pageNumber: 2, numberPictures: 2)
        pages1.albumPage = pagge1
        let pages2 = AlbumPagesViewModelItem()
        let page2 = AlbumPage(pageLayout: .layout3 , pageNumber: 3, numberPictures: 3)
        pages2.albumPage = page2
        let pages3 = AlbumPagesViewModelItem()
        let pagge3 = AlbumPage(pageLayout: .layout4, pageNumber: 4, numberPictures: 3)
        pages3.albumPage = pagge3
        let pages4 = AlbumPagesViewModelItem()
        let page4 = AlbumPage(pageLayout: .layout5 , pageNumber: 5, numberPictures: 3)
        pages4.albumPage = page4
        let pages5 = AlbumPagesViewModelItem()
        let pagge5 = AlbumPage(pageLayout: .layout6, pageNumber: 6, numberPictures: 2)
        pages5.albumPage = pagge5
        sections = [
            AlbumSectionItem(header: "First section", items: [AlbumCoverViewModelItem()]),
            AlbumSectionItem(header: "Second section", items: [pages]),
            AlbumSectionItem(header: "Second section", items: [pages1]),
            AlbumSectionItem(header: "Second section", items: [pages2]),
            AlbumSectionItem(header: "Second section", items: [pages3]),
            AlbumSectionItem(header: "Second section", items: [pages4]),
            AlbumSectionItem(header: "Second section", items: [pages5])
        ]
    }
    
    init(sections: [AlbumSectionItem]) {
        self.sections = sections
    }
    
//    func execute(command: TableViewEditingCommand) -> AlbumViewModel {
//        switch command {
//        case .AppendItem(let appendEvent):
//            var sections = self.sections
//            let items = sections[appendEvent.section].items + appendEvent.item 
//            sections[appendEvent.section] = AlbumSectionItem(original: sections[appendEvent.section], items: items)
//            return AlbumViewModel(sections: sections)
//        case .DeleteItem(let indexPath):
//            var sections = self.sections
//            var items = sections[indexPath.section].items
//            items.remove(at: indexPath.row)
//            sections[indexPath.section] = AlbumSectionItem(original: sections[indexPath.section], items: items)
//            return AlbumViewModel(sections: sections)
//        }
//    }
    
}

struct AlbumSectionItem {
    
    var header: String
    var items: [AlbumViewModelItem]
    
    
}
extension AlbumSectionItem: SectionModelType {
    typealias Item = AlbumViewModelItem
    
    init(original: AlbumSectionItem, items: [Item]) {
        self = original
        self.items = items
    }
}
