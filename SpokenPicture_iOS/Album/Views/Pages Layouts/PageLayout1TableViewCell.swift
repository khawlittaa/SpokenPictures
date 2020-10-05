//
//  PageLayout1TableViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PageLayout1TableViewCell: UITableViewCell {
    
    @IBOutlet weak var addImageBtn: UIButton!
    private  var sourceVC: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setSourceVC(sourceVC: UIViewController){
        self.sourceVC = sourceVC
    }
    
    @IBAction func addImageBtnClicked(_ sender: Any) {
        addImageBtn.showImagePicker(sourceVC: sourceVC!)
        addImageBtn.isHidden = true
    }
    @IBAction func deletePageBtnClicked(_ sender: Any) {
    }
    
}
