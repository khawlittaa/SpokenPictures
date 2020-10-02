//
//  PaymentViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 10/1/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var visaCardButton: UIButton!
    @IBOutlet weak var masterCardCardButton: UIButton!
    
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var NameCardTextField: UITextField!
    @IBOutlet weak var expDateTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.roundEdges()
    }
    
    @IBAction func nextButtonclicked(_ sender: Any) {
        let summaryVC = payment.instantiateViewController(withIdentifier: "SummaryVC")
        navigationController?.pushViewController(summaryVC, animated: true)
    }
    
}
