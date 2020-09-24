//
//  UIViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/12/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit
import YPImagePicker
import TBDropdownMenu

extension UIViewController{
    
    func setBackgrouudImage(imageName: String){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: imageName)
        backgroundImage.contentMode =  UIView.ContentMode.scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    func addNavigationBarItemsWithMenu(iscomplete: Bool){
        self.navigationController?.navigationBar.tintColor = .accentBlack1Main
        let complete = UIImage(named: "complete")
        let menu = UIImage(named: "menuBar")
        let menuButtonItem = UIBarButtonItem(image: menu, style: .plain, target: self, action: #selector(menuOptionTapped))
        let completeButtonItem = UIBarButtonItem(image: complete, style: .plain, target: self, action: #selector(completeOptionTapped))
        completeButtonItem.isEnabled = iscomplete
        self.navigationItem.rightBarButtonItems = [menuButtonItem, completeButtonItem]
        self.navigationItem.backBarButtonItem?.title = ""
        
    }
    @objc func menuOptionTapped()  {
        let item1 = DropdownItem(image: UIImage(named: "orderBlackMaterial")!,title: "Order")
        let item2 = DropdownItem(image: UIImage(named: "editBlack")!, title: "Edit")
        let item3 = DropdownItem(image: UIImage(named: "shareBlack")!, title: "Share")
        let item4 = DropdownItem(image: UIImage(named: "deleteBlack")!, title: "Delete")

        let items = [item1, item2, item3, item4]
        
        let menuView = DropdownMenu(navigationController: navigationController!, items: items)
        menuView.tintColor = UIColor.accentBlack1Main
        menuView.cellBackgroundColor = UIColor.pastelPastel11Main
        menuView.displaySelected = false

        menuView.frame = CGRect(x: 90, y: 20, width: 160, height: 180)
        menuView.updateConstraints()
        menuView.reloadInputViews()
        menuView.tableView.frame = CGRect(x: 90, y: 20, width: 160, height: 180)

        menuView.delegate = self
        menuView.showMenu()
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

extension UIViewController: DropdownMenuDelegate {
    func dropdownMenu(dropdownMenu: DropdownMenu, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("DropdownMenu didselect \(indexPath.row)")
    }

    func dropUpMenuCancel(_ dropUpMenu: DropUpMenu) {
        print("select cancel")
    }
}
