//
//  PageLayout6TableViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PageLayout6TableViewCell: UITableViewCell {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftImageButton: UIButton!
    @IBOutlet weak var rightImageButton: UIButton!
    
    private  var sourceVC: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setSourceVC(sourceVC: UIViewController){
        self.sourceVC = sourceVC
    }
    
    @IBAction func leftImageButtonClicked(_ sender: Any) {
        leftImageButton.showImagePicker(sourceVC: sourceVC!)
        leftImageButton.isHidden = true
    }
    
    @IBAction func rightImageButtonClicked(_ sender: Any) {
        rightImageButton.showImagePicker(sourceVC: sourceVC!)
        rightImageButton.isHidden = true
    }
}
