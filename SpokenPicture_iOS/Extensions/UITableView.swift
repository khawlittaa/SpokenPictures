//
//  UITableView.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/15/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

extension UITableView{
    
    func registerCell(nib: String, cellreuseIdentifier: String) {
         let  basicInfoCell = UINib(nibName: nib, bundle: nil)
         self.register(basicInfoCell, forCellReuseIdentifier: cellreuseIdentifier)
     }
     
     func registerHeaderFooter(nib: String, HeaderFooterreuseIdentifier: String){
         let headerNib = UINib.init(nibName: nib, bundle: nil)
         self.register(headerNib, forHeaderFooterViewReuseIdentifier: HeaderFooterreuseIdentifier)
     }
}
