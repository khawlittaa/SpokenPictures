//
//  ShippingMethodViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 10/1/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class ShippingMethodViewController: UIViewController {
    
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    
    @IBOutlet weak var shipmentMethodesTable: UITableView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        nextButton.roundEdges()
    }
    
    func setUpTableView(){
        shipmentMethodesTable.registerCell(nib: "ShipmentMethodCell", cellreuseIdentifier: "ShipmentMethodCell")
        shipmentMethodesTable.dataSource = self
        
    }
    
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        let PaymentVC = payment.instantiateViewController(withIdentifier: "PaymentVC")
        navigationController?.pushViewController(PaymentVC, animated: true)
    }
}

extension ShippingMethodViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShipmentMethodCell") as! ShipmentMethodCell
        return cell
    }
    
    
    
}
