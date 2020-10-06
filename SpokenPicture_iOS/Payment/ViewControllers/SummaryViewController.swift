//
//  SummaryViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 10/1/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    @IBOutlet weak var orderDetailsTable: UITableView!
    
    @IBOutlet weak var orderButton: UIButton!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var subTotlaLabel: UILabel!
    
    let orderVM = OrderDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderButton.roundEdges()
        SetUpTableView()
        
    }
    
    func SetUpTableView(){
        orderDetailsTable.dataSource = self
        orderDetailsTable.registerCell(nib: "CartItemCell", cellreuseIdentifier: "CartItemCell")
        orderDetailsTable.registerCell(nib: "PaymentCell", cellreuseIdentifier: "PaymentCell")
        orderDetailsTable.registerCell(nib: "ShippingDetailsCell", cellreuseIdentifier: "ShippingDetailsCell")
    }
    
    @IBAction func orderButtonClicked(_ sender: Any) {
        let ConfirmationVC = payment.instantiateViewController(withIdentifier: "ConfirmationVC") as! ConfirmationViewController
        navigationController?.pushViewController(ConfirmationVC, animated: true)
    }
    
}

extension SummaryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderVM.odrerItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = orderVM.odrerItems[indexPath.row]
        switch  item.type {
        case .address:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShippingDetailsCell") as! ShippingDetailsCell
            return cell
        case .item:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell") as! CartItemCell
            return cell
        case .payment:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell") as! PaymentCell
            return cell
        }
    }
    
    
}
