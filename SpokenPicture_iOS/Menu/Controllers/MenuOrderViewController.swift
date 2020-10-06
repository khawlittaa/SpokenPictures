//
//  MenuOrderViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/29/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class MenuOrderViewController: UIViewController {
    
    @IBOutlet weak var ordersTableView: UITableView!
    @IBOutlet weak var noOrdersView: UIView!
    
    let ordersVM = OrdersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    func setUpTableView(){
        ordersTableView.registerCell(nib: "MenuOrderCell", cellreuseIdentifier: "MenuOrderCell")
        ordersTableView.dataSource = self
        ordersTableView.delegate = self
    }
    
}

extension MenuOrderViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersVM.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOrderCell") as! MenuOrderCell
        cell.order = ordersVM.orders[indexPath.row]
        cell.UpdateUI()
        return cell
    }
}
extension MenuOrderViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
