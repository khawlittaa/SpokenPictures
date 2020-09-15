//
//  CreateMenuCVCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/14/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class CreateMenuCell: UICollectionViewCell {
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuOption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUIelements(title: String, imageName: String){
        menuOption.text = title
        menuImage.image = UIImage(named: imageName)
    }
    
}
