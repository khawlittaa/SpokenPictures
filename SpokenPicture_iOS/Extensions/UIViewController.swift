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
    
    func addNavigationBarItemsWithMenu(iscomplete: Bool,isAlbum: Bool = false){
        self.navigationController?.navigationBar.tintColor = .accentBlack1Main
        let complete = UIImage(named: "complete")
        let menu = UIImage(named: "menuBar")
        var menuButtonItem = UIBarButtonItem()
        if isAlbum {
            menuButtonItem = UIBarButtonItem(image: menu, style: .plain, target: self, action: #selector(showAlbumMenu))
            }else{
          menuButtonItem = UIBarButtonItem(image: menu, style: .plain, target: self, action: #selector(showMenu))
            }
     
        let completeButtonItem = UIBarButtonItem(image: complete, style: .plain, target: self, action: #selector(completeOptionTapped))
        completeButtonItem.isEnabled = iscomplete
        self.navigationItem.rightBarButtonItems = [menuButtonItem, completeButtonItem]
        self.navigationItem.backBarButtonItem?.title = ""
    }
    
    @objc  func showAlbumMenu(){
        let item1 = MenuItem(image: UIImage(named: "collaborateBlack")!,title: "Collaborate")
        let item2 = MenuItem(image: UIImage(named: "shareBlack")!, title: "Share")
        let item3 = MenuItem(image: UIImage(named: "orderBlackMaterial")!, title: "Order")
        let item4 = MenuItem(image: UIImage(named: "previewBlack")!, title: "Preview")
        let item5 = MenuItem(image: UIImage(named: "deleteBlack")!, title: "Delete")
        
        let items = [item1, item2, item3, item4, item5]
        
        let menuView = postcard.instantiateViewController(withIdentifier: "PostcardDropMenuVC")
            as! PostcardDropMenuViewController
        menuView.items = items
        menuView.heightValue = 200
        navigationController?.pushViewController(menuView, animated: false)
        self.addChild(menuView)
        menuView.view.frame = self.view.frame
        self.view.addSubview(menuView.view)
        menuView.didMove(toParent: self)
    }
    
    
     @objc func showMenu(){
        let item1 = MenuItem(image: UIImage(named: "orderBlackMaterial")!,title: "Order")
        let item2 = MenuItem(image: UIImage(named: "editBlack")!, title: "Edit")
        let item3 = MenuItem(image: UIImage(named: "shareBlack")!, title: "Share")
        let item4 = MenuItem(image: UIImage(named: "deleteBlack")!, title: "Delete")
        
        let items = [item1, item2, item3, item4]
        
        let menuView = postcard.instantiateViewController(withIdentifier: "PostcardDropMenuVC")
            as! PostcardDropMenuViewController
        menuView.items = items
        navigationController?.pushViewController(menuView, animated: false)
        self.addChild(menuView)
        menuView.view.frame = self.view.frame
        self.view.addSubview(menuView.view)
        menuView.didMove(toParent: self)
        
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
                let editVc = editing.instantiateViewController(withIdentifier: "EditPhotoVC") as! EditPhotoViewController
                editVc.originalImage = photo.originalImage
                editVc.sourcePostcardVM = sourceVm
                self.navigationController?.pushViewController(editVc, animated: true)
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
}

