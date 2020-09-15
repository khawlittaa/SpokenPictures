//
//  CreateAlbumCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/14/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class CreateAlbumCell: UICollectionViewCell {
    @IBOutlet weak var bgImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setBgImage(imageName: String){
        self.bgImage.image = UIImage(named: imageName)
    }
    
  

}
