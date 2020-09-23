//
//  PostcardPortraitLayoutViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/23/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PostcardPortraitLayoutViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var postcardMainView: UIView!
    @IBOutlet weak var postcardPortraitImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI()  {
        postcardMainView.addViewShadow()
        saveButton.roundEdges()
    }
    
    @IBAction func addImageBtnClicked(_ sender: Any) {
        self.showImagePicker()
    }
    
}
