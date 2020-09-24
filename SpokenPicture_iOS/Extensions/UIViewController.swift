//
//  UIViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/12/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit
import YPImagePicker

extension UIViewController{
    
    func setBackgrouudImage(imageName: String){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: imageName)
        backgroundImage.contentMode =  UIView.ContentMode.scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    func addNavigationBarItemsWithMenu(){
        self.navigationController?.navigationBar.tintColor = .accentBlack1Main
        let complete = UIImage(named: "complete")
        let menu = UIImage(named: "menuBar")
        let menuButtonItem = UIBarButtonItem(image: menu, style: .plain, target: self, action: #selector(menuOptionTapped))
        let completeButtonItem = UIBarButtonItem(image: complete, style: .plain, target: self, action: #selector(completeOptionTapped))
        self.navigationItem.rightBarButtonItems = [menuButtonItem, completeButtonItem]
//        self.navigationItem.backBarButtonItem?.title = ""
        
    }
    @objc func menuOptionTapped()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func completeOptionTapped()  {
        // call API
        self.navigationController?.popViewController(animated: true)
    }
    
    func showImagePicker(sourceVm: PostsCardViewModel?){
        var config = YPImagePickerConfiguration()
        config.showsPhotoFilters = false
        config.screens = [.library]
        // Build a picker with your configuration
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                let editVc = album.instantiateViewController(withIdentifier: "EditPhotoVC") as! EditPhotoViewController
                editVc.originalImage = photo.originalImage
                editVc.sourcePostcardVM = sourceVm
                self.navigationController?.pushViewController(editVc, animated: true)
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
}
