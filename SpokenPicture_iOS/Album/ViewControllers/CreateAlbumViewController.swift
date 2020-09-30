//
//  CreateAlbumViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/15/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit
import RxDataSources
import RxCocoa
import RxSwift
import Differentiator

class CreateAlbumViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var albumContentTableView: UITableView!
    
    let createAlbumsVM = AlbumViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.roundEdges()
        addNavigationBarItems()
        setUpTableView()
        setUpBinding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        albumContentTableView.reloadData()
    }
    
    func setUpBinding(){
       let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(
          configureCell: { dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout3TableViewCell", for: indexPath)
//
            return cell
        })
        
        
        let pages = AlbumPagesViewModelItem()
        let page = AlbumPage(pageLayout: .layout5 , pageNumber: 1, numberPictures: 3)
        pages.albumPages.append(page)
        
        let sections = [
            SectionOfCustomData(header: "First section", items: [AlbumCoverViewModelItem()]),
            SectionOfCustomData(header: "Second section", items: [pages]),
            SectionOfCustomData(header: "Second section", items: [pages])
        ]

        Observable.just(sections)
          .bind(to: albumContentTableView.rx.items(dataSource: dataSource))
          .disposed(by: disposeBag)
    }
    
    func setUpTableView(){
//        albumContentTableView.dataSource = self
        
        albumContentTableView.registerCell(nib: "PageLayout1TableViewCell", cellreuseIdentifier: "PageLayout1TableViewCell")
        albumContentTableView.registerCell(nib: "PageLayout2TableViewCell", cellreuseIdentifier: "PageLayout2TableViewCell")
        albumContentTableView.registerCell(nib: "PageLayout3TableViewCell", cellreuseIdentifier: "PageLayout3TableViewCell")
        albumContentTableView.registerCell(nib: "PageLayout4TableViewCell", cellreuseIdentifier: "PageLayout4TableViewCell")
        albumContentTableView.registerCell(nib: "PageLayout5TableViewCell", cellreuseIdentifier: "PageLayout5TableViewCell")
        albumContentTableView.registerCell(nib: "PageLayout6TableViewCell", cellreuseIdentifier: "PageLayout6TableViewCell")
        albumContentTableView.registerCell(nib: "AlbumCoverCell", cellreuseIdentifier: "AlbumCoverCell")
        
    }
    
    func addNavigationBarItems(){
        self.navigationController?.navigationBar.tintColor = .accentBlack1Main
        let complete = UIImage(named: "complete")
        let menu = UIImage(named: "menuBar")
        let menuButtonItem = UIBarButtonItem(image: menu, style: .plain, target: self, action: #selector(menuTapped))
        let completeButtonItem = UIBarButtonItem(image: complete, style: .plain, target: self, action: #selector(completeTapped))
        self.navigationItem.rightBarButtonItems = [menuButtonItem, completeButtonItem]
        
    }
    @objc func menuTapped()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func completeTapped()  {
        // call API
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPageButtonClicked(_ sender: Any){
        
        let popUp = album.instantiateViewController(withIdentifier: "ChooseLayoutViewController") as! ChooseLayoutViewController
        popUp.createAlbumVM = self.createAlbumsVM
        self.addChild(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParent: self)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
    }
}
//
//extension CreateAlbumViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return createAlbumsVM.album[section].rowCount
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return createAlbumsVM.album.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let album = createAlbumsVM.album[indexPath.section]
//        switch album.type {
//        case .cover:
//            if let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCoverCell", for: indexPath) as? AlbumCoverCell {
//                //               cell.item = item
//                return cell
//            }
//        case .pages:
//            // TO Do fix with approriate Layout here
//            let albumPages = album as! AlbumPagesViewModelItem
//            let cellLayout = albumPages.albumPages[indexPath.row].pageLayout
//            switch cellLayout {
//            case .layout1:
//                if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout1TableViewCell", for: indexPath) as? PageLayout1TableViewCell {
//                    //        cell.item = item
//                    return cell}
//            case .layout2:
//                if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout2TableViewCell", for: indexPath) as? PageLayout2TableViewCell {
//                    return cell}
//            case .layout3:
//                if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout3TableViewCell", for: indexPath) as? PageLayout3TableViewCell {
//                    return cell
//                }
//            case .layout4:
//                if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout4TableViewCell", for: indexPath) as? PageLayout4TableViewCell {
//                    return cell
//                }
//            case .layout5:
//                if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout5TableViewCell", for: indexPath) as? PageLayout5TableViewCell {
//                    return cell
//                }
//            case .layout6:
//                if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout6TableViewCell", for: indexPath) as? PageLayout6TableViewCell {
//                    return cell
//                }
//            }
//
//        }
//        // return the default cell if none of above succeed
//        return UITableViewCell()
//    }
//
//}

extension CreateAlbumViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

