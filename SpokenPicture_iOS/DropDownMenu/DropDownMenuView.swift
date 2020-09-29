//
//  DropDownMenuView.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/29/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class DropDownMenuView: UIView {
    @IBOutlet weak var dropDownTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func SetUpTableView(){
        Bundle.main.loadNibNamed("DropDownView", owner: self, options: nil)
//        addSubview(dropDownTableView)
//        dropDownTableView.frame = self.bounds
//        dropDownTableView.registerCell(nib: "DropMenuCell", cellreuseIdentifier: "DropMenuCell")
//        dropDownTableView.backgroundColor =  UIColor.pastelPastel11Main
//        dropDownTableView.dataSource = self
    }
}

extension DropDownMenuView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropMenuCell") as! DropMenuCell
        return cell
    }
    
    
}
