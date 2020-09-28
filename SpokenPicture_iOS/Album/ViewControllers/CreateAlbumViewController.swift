//
//  CreateAlbumViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/15/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class CreateAlbumViewController: UIViewController {
    
    //    @IBOutlet weak var titleTextField: UITextField!
    //    @IBOutlet weak var dateTextField: UITextField!
    //    @IBOutlet weak var albumCoverImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var albumContentTableView: UITableView!
    
    let createAlbumsVM = AlbumViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.roundEdges()
        addNavigationBarItems()
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

extension CreateAlbumViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return createAlbumsVM.album.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = createAlbumsVM.album[indexPath.row]
        switch album.type {
        case .cover:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCoverCell", for: indexPath) as? AlbumCoverCell {
                //               cell.item = item
                return cell
            }
        case .pages:
            // TO Do fix with approriate Layout here
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout4TableViewCell", for: indexPath) as? PageLayout4TableViewCell {
                return cell
            }
        }
        // return the default cell if none of above succeed
        return UITableViewCell()
    }
    
}

extension CreateAlbumViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

