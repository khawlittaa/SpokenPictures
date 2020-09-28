//
//  AlbumCoverCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/28/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class AlbumCoverCell: UITableViewCell {

    @IBOutlet weak var yellowCoverButton: UIButton!
    @IBOutlet weak var purpleCoverButton: UIButton!
    @IBOutlet weak var blueCoverButton: UIButton!
    @IBOutlet weak var whiteCoverButton: UIButton!
    @IBOutlet weak var addImageButton: UIImageView!
    
    @IBOutlet weak var albumCoverImage: UIImageView!
    
    @IBOutlet weak var albumTitleTextField: UITextField!
    @IBOutlet weak var albumDateTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBOutlet weak var addImageButtonClicked: UIImageView!
}
