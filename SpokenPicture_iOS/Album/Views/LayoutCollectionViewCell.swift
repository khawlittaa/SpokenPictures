//
//  LayoutCollectionViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class LayoutCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var layoutImage: UIImageView!
    @IBOutlet weak var lockedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setLayoutUI(layout: Layout){
        layoutImage.image = UIImage(named: layout.layoutImage)
        if layout.isPremium{
            lockedImage.isHidden = false
            layoutImage.alpha = 0.4
        }
    }
    
    override var isSelected: Bool {
        didSet {
            self.isUserInteractionEnabled = self.lockedImage.isHidden
            print("cell is enabled = \(self.isUserInteractionEnabled)")
        }
    }
    
}
