//
//  CreateAlbumViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/15/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class CreateAlbumViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var albumCoverImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var pagesTableView: UITableView!
    
    let createAlbumsVM = CreateAlbumViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.roundEdges()
        addNavigationBarItems()
        setUpTableView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pagesTableView.reloadData()
    }
    
    func setUpTableView(){
        pagesTableView.dataSource = self
        
        pagesTableView.registerCell(nib: "PageLayout1TableViewCell", cellreuseIdentifier: "PageLayout1TableViewCell")
        pagesTableView.registerCell(nib: "PageLayout2TableViewCell", cellreuseIdentifier: "PageLayout2TableViewCell")
        pagesTableView.registerCell(nib: "PageLayout3TableViewCell", cellreuseIdentifier: "PageLayout3TableViewCell")
        pagesTableView.registerCell(nib: "PageLayout4TableViewCell", cellreuseIdentifier: "PageLayout4TableViewCell")
        pagesTableView.registerCell(nib: "PageLayout5TableViewCell", cellreuseIdentifier: "PageLayout5TableViewCell")
        pagesTableView.registerCell(nib: "PageLayout6TableViewCell", cellreuseIdentifier: "PageLayout6TableViewCell")
        
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
    
    @IBAction func yellowButtonClicked(_ sender: Any) {
        let btn = sender as! UIButton
        btn.selectedRadioButton()
        print("selected yellow color ")
    }
    
    @IBAction func purpleButtonClicked(_ sender: Any) {
        let btn = sender as! UIButton
        btn.selectedRadioButton()
        print("selected purple color ")
    }
    
    @IBAction func whiteBtnClicked(_ sender: Any) {
        let btn = sender as! UIButton
        btn.selectedRadioButton()
        print("selected white color ")
    }
    
    @IBAction func blueButtonClicked(_ sender: Any) {
        let btn = sender as! UIButton
        btn.selectedRadioButton()
        print("selected blue color ")
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
        return createAlbumsVM.pages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let page = createAlbumsVM.pages[indexPath.row]
        switch page.type {
        case .layout1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout1TableViewCell", for: indexPath) as? PageLayout1TableViewCell {
                //                cell.item = item
                return cell}
        case .layout2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout2TableViewCell", for: indexPath) as? PageLayout2TableViewCell {
                return cell}
            
        case .layout3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout3TableViewCell", for: indexPath) as? PageLayout3TableViewCell {
                return cell
            }
            
        case .layout4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout4TableViewCell", for: indexPath) as? PageLayout4TableViewCell {
                return cell
            }
            
        case .layout5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout5TableViewCell", for: indexPath) as? PageLayout5TableViewCell {
                return cell
            }
            
        case .layout6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PageLayout6TableViewCell", for: indexPath) as? PageLayout6TableViewCell {
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

