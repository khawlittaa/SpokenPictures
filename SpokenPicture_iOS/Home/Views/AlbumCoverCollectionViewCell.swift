//
//  AlbumCoverCollectionViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/14/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class AlbumCoverCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setBgColor(color: UIColor){
        self.mainView.backgroundColor = color
    }
    
}
