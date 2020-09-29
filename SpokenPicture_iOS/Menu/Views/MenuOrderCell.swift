//
//  MenuOrderCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/29/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class MenuOrderCell: UITableViewCell {
    @IBOutlet weak var AlbumCoverView: UIView!
    @IBOutlet weak var albumCoverImage: UIImageView!
    @IBOutlet weak var orderTypeLabel: UILabel!
    
    @IBOutlet weak var dateOrderReceivedLabel: UILabel!
    @IBOutlet weak var albumNumberPages: UILabel!
    @IBOutlet weak var OrderAlbumTitleLabel: UILabel!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumDateCreationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
