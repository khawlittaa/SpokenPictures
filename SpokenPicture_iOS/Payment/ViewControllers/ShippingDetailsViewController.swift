//
//  ShippingDetailsViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 10/1/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class ShippingDetailsViewController: UIViewController {
    @IBOutlet weak var checkMarkButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var progressImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.roundEdges()
    }
    
    @IBAction func checkmarkButtonClicked(_ sender: Any) {
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
    }
    
}
