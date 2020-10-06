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
    
    var item : AlbumPagesViewModelItem?{
        didSet{
            print("album page layout 3 did set \(item?.albumPage?.images?.count) images ")
            if let pageNumber = item?.albumPage?.pageNumber{
                pageNumberLabel.text = "page \(pageNumber)"
            }
            if let images = item?.albumPage?.images{
                if images.count > 0 {
                    topleftImageView.image = images[0]
                    
                }
                if images.count > 1 {
                    buttomLeftImageView.image = images[1]
                }else{
                    if images.count > 2{
                        rightImageView.image = images[2]
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var pageNumberLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var buttomLeftImageView: UIImageView!
    @IBOutlet weak var topleftImageView: UIImageView!
    
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
        image3Button.showImagePicker(sourceVC: sourceVC!, pageItem: item)
        image3Button.isHidden = true
    }
}
