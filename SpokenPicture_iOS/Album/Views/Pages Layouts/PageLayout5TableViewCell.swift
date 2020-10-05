//
//  PageLayout5TableViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PageLayout5TableViewCell: UITableViewCell {
    
    private  var sourceVC: UIViewController?
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var topRightImageView: UIImageView!
    @IBOutlet weak var bottomRightImageView: UIImageView!
    
    @IBOutlet weak var bottomRightImageButton: UIButton!
    @IBOutlet weak var topRightImageButton: UIButton!
    @IBOutlet weak var leftImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setSourceVC(sourceVC: UIViewController){
        self.sourceVC = sourceVC
    }
    
    @IBAction func bottomRightImageButtonClicked(_ sender: Any) {
        bottomRightImageButton.showImagePicker(sourceVC: sourceVC!, pageItem: nil, coverItem: nil)
        bottomRightImageButton.isHidden = true
    }
    
    @IBAction func topRightImageButtonClicked(_ sender: Any) {
        topRightImageButton.showImagePicker(sourceVC: sourceVC!)
        topRightImageButton.isHidden = true
    }
    
    @IBAction func leftImagebuttonClicked(_ sender: Any) {
        leftImageButton.showImagePicker(sourceVC: sourceVC!)
        leftImageButton.isHidden = true
    }
}
