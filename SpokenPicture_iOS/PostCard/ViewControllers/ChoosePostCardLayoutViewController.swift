//
//  ChoosePostCardLayoutViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/21/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class ChoosePostCardLayoutViewController: UIViewController {
    
    @IBOutlet weak var postcardMainView: UIView!
    @IBOutlet weak var fromtBackView: UIView!
    @IBOutlet weak var dropDownMenuView: DropDownMenuView!
    
    @IBOutlet weak var chooseLayoutButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var isPostcard: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        addNavigationBarItemsWithMenu(iscomplete: true)
        dropDownMenuView.SetUpTableView()
    }
    
    
    func addNavigationBarItems(){
        self.navigationController?.navigationBar.tintColor = .accentBlack1Main
        let complete = UIImage(named: "complete")
        let menu = UIImage(named: "menuBar")
        let menuButtonItem = UIBarButtonItem(image: menu, style: .plain, target: self, action: #selector(menuTapped))
        let completeButtonItem = UIBarButtonItem(image: complete, style: .plain, target: self, action: #selector(completeTapped))
        self.navigationItem.rightBarButtonItems = [menuButtonItem, completeButtonItem]
        
    }
    
    func setUpUI()  {
        postcardMainView.addViewShadow()
        chooseLayoutButton.addButtonShadow()
        saveButton.roundEdges()
        if !isPostcard {
            fromtBackView.isHidden = true
            titleTextField.placeholder = "My Photo"
        }
    }
    
    
    @objc func menuTapped()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func completeTapped()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
    }
    
    @IBAction func chooseLayoutButtonClicked(_ sender: Any) {
        let popUp = postcard.instantiateViewController(withIdentifier: "PostCardLayoutPopUpVC") as! PostCardLayoutPopUpViewController
        self.addChild(popUp)
        popUp.view.frame = self.view.frame
        popUp.postcardVC = self
        self.view.addSubview(popUp.view)
        popUp.didMove(toParent: self)
    }
    
}
