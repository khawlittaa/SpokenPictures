//
//  MenuCartViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/30/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class MenuCartViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var subtotalLabel: UILabel!
    
    @IBOutlet weak var cartItemstableView: UITableView!
    
    @IBOutlet weak var checkoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUptableView()
        checkoutButton.roundEdges()
        
    }
    
    func setUptableView(){
        cartItemstableView.registerCell(nib: "CartItemCell", cellreuseIdentifier: "CartItemCell")
        cartItemstableView.dataSource = self
    }
    
    @IBAction func checkOutButtonClicked(_ sender: Any) {
    }
}

extension MenuCartViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell") as! CartItemCell
        return cell
    }
    
    
    
}
