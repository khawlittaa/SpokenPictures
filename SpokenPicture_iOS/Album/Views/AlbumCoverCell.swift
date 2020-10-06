//
//  AlbumCoverCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/28/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class AlbumCoverCell: UITableViewCell {
    
    var item : AlbumCoverViewModelItem?{
        didSet{
            print("album cover did set")
            if let image = item?.coverImage{
                albumCoverImage.image = image
            } 
        }
    }
    
    private  var sourceVC: UIViewController?
    
    @IBOutlet weak var yellowCoverButton: UIButton!
    @IBOutlet weak var purpleCoverButton: UIButton!
    @IBOutlet weak var blueCoverButton: UIButton!
    @IBOutlet weak var whiteCoverButton: UIButton!
    @IBOutlet weak var addImageButton: UIButton!
    
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
    
    func setSourceVC(sourceVC: UIViewController){
          self.sourceVC = sourceVC
      }
    
    @IBAction func addImageButtonClicked(_ sender: Any) {
        addImageButton.showImagePicker(sourceVC: sourceVC!, coverItem: item)
        addImageButton.isHidden = true
    }

    @IBAction func btnClicked(sender:UIButton){

        let buttonArray = [yellowCoverButton,purpleCoverButton,blueCoverButton,whiteCoverButton]

        buttonArray.forEach{
            $0?.isSelected = false
        }
 
        sender.isSelected = true
        sender.selectedRadioButton()

    }
    
}
