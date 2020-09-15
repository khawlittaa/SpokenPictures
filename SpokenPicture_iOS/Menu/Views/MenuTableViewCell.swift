//
//  MenuTableViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/15/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuItemImage: UIImageView!
    @IBOutlet weak var menuItemTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpUI(image: String, title: String) {
        menuItemImage.image = UIImage(named: image)
        menuItemTitle.text = title
        
    }
    
}
