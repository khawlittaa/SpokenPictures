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
    
    @IBOutlet weak var billingAdreesView: UIView!
    @IBOutlet weak var billingAddressViewheightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.roundEdges()
        billingAdreesView.isHidden = true
        billingAddressViewheightConstraint.constant = 0
    }
    //MARK: NOTE: needs a VM and state binding here using rxSwift
    @IBAction func checkmarkButtonClicked(_ sender: Any) {
        billingAdreesView.isHidden = false
        checkMarkButton.setImage(UIImage(named: "checkYellow"), for: .normal)
billingAddressViewheightConstraint.constant = 387
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        let shipMethod = payment.instantiateViewController(withIdentifier: "ShippingMethodVC")
        navigationController?.pushViewController(shipMethod, animated: true)
    }
    
}
