//
//  PageLayout2TableViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PageLayout2TableViewCell: UITableViewCell {
    @IBOutlet weak var pageNumberLabel: UILabel!
    @IBOutlet weak var buttomImageView: UIImageView!
    @IBOutlet weak var topImageView: UIImageView!
    
    @IBOutlet weak var addButtomImageButton: UIButton!
    @IBOutlet weak var addTopImageButton: UIButton!
    private  var sourceVC: UIViewController?
    
    var item : AlbumPagesViewModelItem?{
        didSet{
            print("album page layout 2 did set \(item?.albumPage?.images?.count) images ")
            if let pageNumber = item?.albumPage?.pageNumber{
                pageNumberLabel.text = "page \(pageNumber)"
            }
            if let images = item?.albumPage?.images{
                if images.count > 0 {
                    topImageView.image = images[0]
                }
                if images.count > 1 {
                    buttomImageView.image = images[1]
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
    
    @IBAction func addTopImageButtonClicked(_ sender: Any) {
        addTopImageButton.showImagePicker(sourceVC: sourceVC!, pageItem: item, coverItem: nil)
        addTopImageButton.isHidden = true
        
    }
    
    @IBAction func addButtomImageButtonClicked(_ sender: Any) {
        addButtomImageButton.showImagePicker(sourceVC: sourceVC!, pageItem: item)
        addButtomImageButton.isHidden = true
    }
    
}
