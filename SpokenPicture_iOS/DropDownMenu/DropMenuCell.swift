//
//  DropMenuCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/29/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class DropMenuCell: UITableViewCell {
    @IBOutlet weak var menuItemImage: UIImageView!
    
    @IBOutlet weak var menuItemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCellDate(menuItem: MenuItem){
        menuItemImage.image = menuItem.image
        menuItemLabel.text = menuItem.title
    }
    
}
