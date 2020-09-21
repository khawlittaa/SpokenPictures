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
    @IBOutlet weak var chooseLayoutButton: UIButton!
    @IBOutlet weak var postCardImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var postCardSideSegment: UISegmentedControl!
    
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
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
    
    func setUpUI()  {
        postcardMainView.addViewShadow()
        chooseLayoutButton.addButtonShadow()
        saveButton.roundEdges()
        postCardImage.addViewShadow()
        postCardImage.isHidden = true
        
        let myImage = UIImage(named: "verticaLline")
        // Image between two unselected segments.
        postCardSideSegment.setDividerImage(myImage, forLeftSegmentState: UIControl.State.normal, rightSegmentState: UIControl.State.normal, barMetrics: UIBarMetrics.default)
        postCardSideSegment.backgroundColor = .white
    
    }
    
    
    @objc func menuTapped()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func completeTapped()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func chooseLayoutButtonClicked(_ sender: Any) {
        let popUp = postcard.instantiateViewController(withIdentifier: "PostCardLayoutPopUpVC") as! PostCardLayoutPopUpViewController
               self.addChild(popUp)
               popUp.view.frame = self.view.frame
               self.view.addSubview(popUp.view)
               popUp.didMove(toParent: self)
    }
    
}
