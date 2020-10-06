//
//  PageLayout4TableViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PageLayout4TableViewCell: UITableViewCell {
    
    var item : AlbumPagesViewModelItem?{
        didSet{
            print("album page layout 4 did set \(item?.albumPage?.images?.count) images ")
            if let pageNumber = item?.albumPage?.pageNumber{
                pageNumberLabel.text = "page \(pageNumber)"
            }
            if let images = item?.albumPage?.images{
                if images.count > 0 {
                    topImageImageView.image = images[0]
                    
                }
                if images.count > 1 {
                    bottomRightImageImageView.image = images[1]
                }else{
                    if images.count > 2{
                        bottomLeftImageImageView.image = images[2]
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var pageNumberLabel: UILabel!
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
        addTopImageButton.showImagePicker(sourceVC: sourceVC!, pageItem: item)
        addTopImageButton.isHidden = true
    }
    
}
