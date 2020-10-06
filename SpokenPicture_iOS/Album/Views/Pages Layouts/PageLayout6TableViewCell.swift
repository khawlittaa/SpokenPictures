//
//  PageLayout6TableViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PageLayout6TableViewCell: UITableViewCell {
    
    @IBOutlet weak var pageNumberLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftImageButton: UIButton!
    @IBOutlet weak var rightImageButton: UIButton!
    
    private  var sourceVC: UIViewController?
    
    
    var item : AlbumPagesViewModelItem?{
        didSet{
            print("album page layout 6 did set \(item?.albumPage?.images?.count) images ")
            if let pageNumber = item?.albumPage?.pageNumber{
                pageNumberLabel.text = "page \(pageNumber)"
            }
            if let images = item?.albumPage?.images{
                if images.count > 0 {
                    leftImageView.image = images[0]
                    
                }
                if images.count > 1 {
                    rightImageView.image = images[1]
                }
            }
        }
    }
    
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
        rightImageButton.showImagePicker(sourceVC: sourceVC!, pageItem: item)
        rightImageButton.isHidden = true
    }
}
