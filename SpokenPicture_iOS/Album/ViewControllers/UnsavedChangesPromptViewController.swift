//
//  UnsavedChangesPromptViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 10/7/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class UnsavedChangesPromptViewController: UIViewController {

    @IBOutlet weak var leaveButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpUI()

    }
    
    func SetUpUI(){
        leaveButton.underline()
        completeButton.layer.cornerRadius = 12
        completeButton.clipsToBounds = true
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
    }
    
    @IBAction func completeButtonClicked(_ sender: Any) {
    }
    
    @IBAction func leaveButtonClicked(_ sender: Any) {
    }
}
