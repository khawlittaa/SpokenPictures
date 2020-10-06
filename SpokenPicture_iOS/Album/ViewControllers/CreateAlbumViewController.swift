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
    
    let albumsVM = AlbumViewModel()
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
        
        let initialState = AlbumViewModel(sections: albumsVM.sections)
        let add3ItemsAddStart = Observable.of((), (), ())
        
        let addCommand = Observable.of(saveButton.rx.tap.asObservable(), add3ItemsAddStart)
            .merge()
            .map(TableViewEditingCommand.addRandomItem)
        
        let deleteCommand = albumContentTableView.rx.itemDeleted.asObservable()
            .map(TableViewEditingCommand.DeleteItem)
        //
        //        Observable.of(addCommand, deleteCommand)
        //        .merge()
        //        .scan(initialState) { (state: AlbumViewModel, command: TableViewEditingCommand) -> AlbumViewModel in
        //            return state.execute(command: command)
        //        }
        //        .startWith(initialState)
        //        .map {
        //            $0.sections
        //        }
        //        .share(replay: 1)
        //        .bind(to: tableView.rx.items(dataSource: dataSource))
        //        .disposed(by: disposeBag)
        
        let dataSource = RxTableViewSectionedReloadDataSource<AlbumSectionItem>(
            configureCell: { dataSource, tableView, indexPath, item in
                switch item.type{
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
        })
        
        
        Observable.just(albumsVM.sections)
            .bind(to: albumContentTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    func setUpTableView(){
        
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
        //        popUp.createAlbumVM = self.createAlbumsVM
        self.addChild(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParent: self)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
    }
}

//extension CreateAlbumViewController {
//    static func dataSource() -> RxTableViewSectionedAnimatedDataSource<AlbumSectionItem> {
//        return RxTableViewSectionedAnimatedDataSource(
//            animationConfiguration: AnimationConfiguration(insertAnimation: .top,
//                                                                   reloadAnimation: .fade,
//                                                                   deleteAnimation: .left),
//            configureCell: { _, table, idxPath, item in
//                let cell = table.dequeueReusableCell(withIdentifier: "Cell", for: idxPath)
//                cell.textLabel?.text = "\(item)"
//                return cell
//            },
//            titleForHeaderInSection: { ds, section -> String? in
//                return ds[section].header
//            },
//            canEditRowAtIndexPath: { _, _ in
//                return true
//            },
//            canMoveRowAtIndexPath: { _, _ in
//                return true
//            }
//        )
//    }
//}

extension TableViewEditingCommand {
    static func addRandomItem() -> TableViewEditingCommand {
        let page = AlbumPagesViewModelItem()
        page.albumPage = AlbumPage(pageLayout: .layout5, pageNumber: 2, numberPictures: 3)
        let item = AlbumSectionItem(header: "", items: [page])
        return TableViewEditingCommand.AppendItem(item: item, section: 2)
    }
}

extension CreateAlbumViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

