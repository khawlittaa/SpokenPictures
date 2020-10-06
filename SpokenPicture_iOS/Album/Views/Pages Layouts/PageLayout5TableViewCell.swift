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
    
    var item : AlbumPagesViewModelItem?{
        didSet{
            print("album page layout 5 did set \(item?.albumPage?.images?.count) images ")
            if let pageNumber = item?.albumPage?.pageNumber{
                pageNumberLabel.text = "page \(pageNumber)"
            }
            if let images = item?.albumPage?.images{
                if images.count > 0 {
                    topRightImageView.image = images[0]
                    
                }
                if images.count > 1 {
                    leftImageView.image = images[1]
                }else{
                    if images.count > 2{
                        bottomRightImageView.image = images[2]
                    }
                }
            }
        }
    }
    @IBOutlet weak var pageNumberLabel: UILabel!
    
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
        leftImageButton.showImagePicker(sourceVC: sourceVC!, pageItem: item)
        leftImageButton.isHidden = true
    }
}
