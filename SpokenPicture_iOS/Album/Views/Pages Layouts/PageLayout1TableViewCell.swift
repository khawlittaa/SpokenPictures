//
//  PageLayout1TableViewCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PageLayout1TableViewCell: UITableViewCell {
    @IBOutlet weak var addimageButttonHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var addImageBtn: UIButton!
    @IBOutlet weak var pageNumberLabel: UILabel!
    
    private  var sourceVC: UIViewController?
    
    var item : AlbumPagesViewModelItem?{
        didSet{
            print("album page layout 1 did set \(item?.albumPage?.images?.count) images ")
            if let pageNumber = item?.albumPage?.pageNumber{
                pageNumberLabel.text = "page \(pageNumber)"
            }
            
            if let images = item?.albumPage?.images{
                if images.count > 0 {
                    albumImageView.image = images[0]
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        addImagePressAction()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setSourceVC(sourceVC: UIViewController){
        self.sourceVC = sourceVC
    }
    
    func addImagePressAction(){
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showImageEditingMenu))
        longPressRecognizer.minimumPressDuration = 0.2
        self.albumImageView.addGestureRecognizer(longPressRecognizer)
    }
    
    @objc func showImageEditingMenu(sender: UILongPressGestureRecognizer) {
        print("longpressed")
//       if sender.state == .began {
//          self.becomeFirstResponder()
//       }
    }
    
    @IBAction func addImageBtnClicked(_ sender: Any) {
        addImageBtn.showImagePicker(sourceVC: sourceVC!, pageItem: item)
        addImageBtn.isHidden = true
        addimageButttonHeightConstraint.constant = 0
    }
    
    @IBAction func deletePageBtnClicked(_ sender: Any) {
    }
    
}
