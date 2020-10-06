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
    @IBOutlet weak var addPageButton: UIButton!
    
    @IBOutlet weak var albumContentTableView: UITableView!
    
    let albumsVM = AlbumViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.roundEdges()
        addNavigationBarItemsWithMenu(iscomplete: true, isAlbum: true)
        setUpTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        albumContentTableView.reloadData()
    }
    
    func setUpTableView(){
        albumContentTableView.dataSource = self
        albumContentTableView.registerCell(nib: "PageLayout1TableViewCell", cellreuseIdentifier: "PageLayout1TableViewCell")
        albumContentTableView.registerCell(nib: "PageLayout2TableViewCell", cellreuseIdentifier: "PageLayout2TableViewCell")
        albumContentTableView.registerCell(nib: "PageLayout3TableViewCell", cellreuseIdentifier: "PageLayout3TableViewCell")
        albumContentTableView.registerCell(nib: "PageLayout4TableViewCell", cellreuseIdentifier: "PageLayout4TableViewCell")
        albumContentTableView.registerCell(nib: "PageLayout5TableViewCell", cellreuseIdentifier: "PageLayout5TableViewCell")
        albumContentTableView.registerCell(nib: "PageLayout6TableViewCell", cellreuseIdentifier: "PageLayout6TableViewCell")
        albumContentTableView.registerCell(nib: "AlbumCoverCell", cellreuseIdentifier: "AlbumCoverCell")
        
    }
    
    
    func showAddPagePopUp(){
        let popUp = album.instantiateViewController(withIdentifier: "ChooseLayoutViewController") as! ChooseLayoutViewController
        //        popUp.createAlbumVM = self.createAlbumsVM
        self.addChild(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParent: self)
    }
    
    @IBAction func addPageButtonClicked(_ sender: Any){
        
        let pages = AlbumPagesViewModelItem()
        let page = AlbumPage(pageLayout: .layout1 , pageNumber: albumsVM.sections.count, numberPictures: 1)
        pages.albumPage = page
        self.albumsVM.sections.append(
            AlbumSectionItem(header: "Second section", items: [pages]))
        self.albumContentTableView.reloadData()
        
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
    }
}

extension CreateAlbumViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension CreateAlbumViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return albumsVM.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let page = albumsVM.sections[indexPath.section]
        let item = page.items[indexPath.row]
        switch item.type    {
        case .cover:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCoverCell", for: indexPath) as? AlbumCoverCell {
                cell.setSourceVC(sourceVC: self)
                cell.item = item as? AlbumCoverViewModelItem
                return cell
            }
        case .pages:
            // TO Do fix with approriate Layout here
            let albumPages = item as! AlbumPagesViewModelItem
            let cellLayout = albumPages.albumPage?.pageLayout
            switch cellLayout
            {
            case .layout1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout1TableViewCell", for: indexPath) as! PageLayout1TableViewCell
                cell.setSourceVC(sourceVC: self)
                cell.item = item as? AlbumPagesViewModelItem
                return cell
                
            case .layout2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout2TableViewCell", for: indexPath) as! PageLayout2TableViewCell
                cell.item = item as? AlbumPagesViewModelItem
                cell.setSourceVC(sourceVC: self)
                return cell
            case .layout3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout3TableViewCell", for: indexPath) as! PageLayout3TableViewCell
                cell.setSourceVC(sourceVC: self)
                cell.item = item as? AlbumPagesViewModelItem
                return cell
            case .layout4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout4TableViewCell", for: indexPath) as! PageLayout4TableViewCell
                cell.setSourceVC(sourceVC: self)
                cell.item = item as? AlbumPagesViewModelItem
                return cell
            case .layout5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout5TableViewCell", for: indexPath) as! PageLayout5TableViewCell
                cell.setSourceVC(sourceVC: self)
                cell.item = item as? AlbumPagesViewModelItem
                return cell
            case .layout6:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout6TableViewCell", for: indexPath) as! PageLayout6TableViewCell
                cell.setSourceVC(sourceVC: self)
                cell.item = item as? AlbumPagesViewModelItem
                return cell
            case .none:
                return UITableViewCell()
            }
        }
        // return the default cell if none of above succeed
        return UITableViewCell()
    }
    
}

