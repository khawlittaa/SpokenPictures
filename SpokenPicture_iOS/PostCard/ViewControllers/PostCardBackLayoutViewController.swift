//
//  PostCardBackLayoutViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/23/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PostCardBackLayoutViewController: UIViewController {
    
    @IBOutlet weak var postcardBackView: UIView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
   func setUpUI()  {
          postcardBackView.addViewShadow()
          saveButton.roundEdges()
      }
    
}
