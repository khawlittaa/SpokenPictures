//
//  CompletePromptViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 10/7/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class CompletePromptViewController: UIViewController {

    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var remiderCheckBoxButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        completeButton.layer.cornerRadius = 15
        completeButton.clipsToBounds = true
    }
    

    @IBAction func remiderCheckBoxButtonClicked(_ sender: Any) {
        remiderCheckBoxButton.setImage(UIImage(named: "checkYellow"), for: .selected)
    }
    
    @IBAction func completeButtonClicked(_ sender: Any) {
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
    }
}
