//
//  ConfirmationViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 10/1/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    @IBOutlet weak var backhomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backhomeButton.roundEdges()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func backhomeButtonClicked(_ sender: Any) {
        let homeNav = home.instantiateViewController(withIdentifier: "HomeViewController") 
        navigationController?.pushViewController(homeNav, animated: true)
    }
    
}
