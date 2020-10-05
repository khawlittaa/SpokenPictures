//
//  PageLayout4TableViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PageLayout4TableViewCell: UITableViewCell {
    
    private  var sourceVC: UIViewController?
    @IBOutlet weak var topImageImageView: UIImageView!
    @IBOutlet weak var bottomLeftImageImageView: UIImageView!
    @IBOutlet weak var bottomRightImageImageView: UIImageView!
    
    @IBOutlet weak var addBottomRightImageButton: UIButton!
    @IBOutlet weak var addBottomLeftImageButton: UIButton!
    @IBOutlet weak var addTopImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setSourceVC(sourceVC: UIViewController){
        self.sourceVC = sourceVC
    }
    
    @IBAction func addButtomRightImageButtonClicked(_ sender: Any) {
        addBottomRightImageButton.showImagePicker(sourceVC: sourceVC!)
        addBottomRightImageButton.isHidden = true
    }
    
    @IBAction func addButtomLeftImageButtonClicked(_ sender: Any) {
        addBottomLeftImageButton.showImagePicker(sourceVC: sourceVC!)
        addBottomLeftImageButton.isHidden = true
    }
    
    @IBAction func addTopImageButtonClicked(_ sender: Any) {
        addTopImageButton.showImagePicker(sourceVC: sourceVC!)
        addTopImageButton.isHidden = true
    }
    
}
