//
//  PostcardLandScapeLayoutViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/23/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PostCardLayoutViewController: UIViewController {
    
    @IBOutlet weak var postacarsMainViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var postcardImageHeightConstraint: NSLayoutConstraint!
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
        if postCardVm.isLandScape{
            postacarsMainViewLeadingConstraint.constant = 20
            postcardImageHeightConstraint.constant = 200
            
        }else{
            if postCardVm.isPortarait{
                postacarsMainViewLeadingConstraint.constant = 60
                postcardImageHeightConstraint.constant = 300
                
            }
        }
    }
    
    @IBAction func addImageButtonClicked(_ sender: Any) {
        self.showImagePicker(sourceVm: postCardVm)
    }
}
