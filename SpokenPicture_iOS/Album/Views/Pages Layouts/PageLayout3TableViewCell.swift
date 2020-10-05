//
//  PageLayout3TableViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PageLayout3TableViewCell: UITableViewCell {
    
    private  var sourceVC: UIViewController?
    
    @IBOutlet weak var image3ImageView: UIButton!
    @IBOutlet weak var image2ImageView: UIImageView!
    @IBOutlet weak var image1ImageView: UIImageView!
    
    @IBOutlet weak var image1Button: UIButton!
    @IBOutlet weak var image2Button: UIButton!
    @IBOutlet weak var image3Button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setSourceVC(sourceVC: UIViewController){
        self.sourceVC = sourceVC
    }
    
    @IBAction func image3ButtonClicked(_ sender: Any) {
        image1Button.showImagePicker(sourceVC: sourceVC!)
        image1Button.isHidden = true
    }
    
    @IBAction func image1ButtonClicked(_ sender: Any) {
        image2Button.showImagePicker(sourceVC: sourceVC!)
        image2Button.isHidden = true
    }
    
    @IBAction func image2ButtonClicked(_ sender: Any) {
        image3Button.showImagePicker(sourceVC: sourceVC!)
        image3Button.isHidden = true
    }
}
