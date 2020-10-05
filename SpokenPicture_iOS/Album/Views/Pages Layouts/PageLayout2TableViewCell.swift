//
//  PageLayout2TableViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PageLayout2TableViewCell: UITableViewCell {
    @IBOutlet weak var buttomImageView: UIImageView!
    @IBOutlet weak var topImageView: UIImageView!
    
    @IBOutlet weak var addButtomImageButton: UIButton!
    @IBOutlet weak var addTopImageButton: UIButton!
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
    
    @IBAction func addTopImageButtonClicked(_ sender: Any) {
        addTopImageButton.showImagePicker(sourceVC: sourceVC!)
        addTopImageButton.isHidden = true
        
    }
    
    @IBAction func addButtomImageButtonClicked(_ sender: Any) {
        addButtomImageButton.showImagePicker(sourceVC: sourceVC!)
        addButtomImageButton.isHidden = true
    }
    
}
