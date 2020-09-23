//
//  PostcardLandScapeLayoutViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/23/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PostcardLandScapeLayoutViewController: UIViewController {
    
    @IBOutlet weak var postcardLanscapeImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var postcardMainView: UIView!
    
    var postCardVm = PostsCardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        postCardVm.isLandScape = true
    }
    
    func setUpUI()  {
        postcardMainView.addViewShadow()
        saveButton.roundEdges()
    }
    
    @IBAction func addImageButtonClicked(_ sender: Any) {
        self.showImagePicker(sourceVm: postCardVm)
    }
}
