//
//  AlbumMenuPromptViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 10/7/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class AlbumMenuPromptViewController: UIViewController {
    
    @IBOutlet weak var promtMainView: UIView!
    @IBOutlet weak var promptTitleLabel: UILabel!
    @IBOutlet weak var promptMessageLabel: UILabel!
    
    @IBOutlet weak var promptactionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        promtMainView.addViewShadow()

    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
    }
    
    @IBAction func promptActionButtonClicked(_ sender: Any) {
    }
    
}
