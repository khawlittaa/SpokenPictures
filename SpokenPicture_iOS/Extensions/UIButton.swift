//
//  UIButton.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/11/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit
import YPImagePicker
import TBDropdownMenu

extension UIButton{
    
    var isValid: Bool {
        get {
            return isEnabled && backgroundColor == .accentAccent31Main
        }
        set {
            backgroundColor = newValue ? .accentAccent31Main : .grey3Disabled
            isEnabled = newValue
        }
    }
    
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        //NSAttributedStringKey.foregroundColor : UIColor.blue
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    func roundEdges(){
        self.layer.cornerRadius = 23
        self.clipsToBounds = true
    }
    
    func setSkipButtonAppearance(){
        self.titleLabel?.textColor = .grey1Main
        self.underline()
    }
    
    func selectedRadioButton(){
        let bgImage = UIImage(named: "coverColorSelection")
        self.setBackgroundImage(bgImage, for: .normal)
    }
    
    func addButtonShadow(){
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 4.0
    }
    
    func showImagePicker(sourceVC: UIViewController, pageItem: AlbumPagesViewModelItem? = nil, coverItem: AlbumCoverViewModelItem? = nil ){
        var config = YPImagePickerConfiguration()
        config.showsPhotoFilters = false
        config.showsVideoTrimmer = false
        config.screens = [.library]
        config.library.mediaType = .photoAndVideo
        config.video.fileType = .mov
        config.video.libraryTimeLimit = 20.0
        config.video.minimumTimeLimit = 15.0
        // Build a picker with your configuration
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                let editVc = editing.instantiateViewController(withIdentifier: "EditPhotoVC") as! EditPhotoViewController
                editVc.originalImage = photo.originalImage
                editVc.albumPageItem = pageItem
                editVc.albumCoverItem = coverItem
                sourceVC.navigationController?.pushViewController(editVc, animated: true)
            }else{
                if let video = items.singleVideo {
                     print(video.fromCamera)
                     print(video.thumbnail)
                     print(video.url)
                    let VideoThummbnailVC = editing.instantiateViewController(withIdentifier: "VideoThummbnailVC") as! VideoThummbnailViewController
                    sourceVC.navigationController?.pushViewController(VideoThummbnailVC, animated: true)
                 }
            }
            picker.dismiss(animated: true, completion: nil)
        }
        sourceVC.present(picker, animated: true, completion: nil)
    }
}
