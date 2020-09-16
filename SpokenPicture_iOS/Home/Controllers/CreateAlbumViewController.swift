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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.roundEdges()
        addNavigationBarItems()

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
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
    }
    
}
