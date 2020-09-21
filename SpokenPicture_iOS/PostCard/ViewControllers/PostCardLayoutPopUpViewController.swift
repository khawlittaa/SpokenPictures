//
//  PostCardLayoutPopUpViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/21/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit
import YPImagePicker

class PostCardLayoutPopUpViewController: UIViewController {
    
    var postcardVC: ChoosePostCardLayoutViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if(finished)
            {
                self.willMove(toParent: nil)
                self.view.removeFromSuperview()
                self.removeFromParent()
            }
        })
    }
    func showImagePicker(){
        var config = YPImagePickerConfiguration()
        config.showsPhotoFilters = false
        // Build a picker with your configuration
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                let editVc = album.instantiateViewController(withIdentifier: "EditPhotoVC") as! EditPhotoViewController
                editVc.originalImage = photo.originalImage
                editVc.sourcePostcard = self.postcardVC
                self.navigationController?.pushViewController(editVc, animated: true)
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func landscapeButtonClicked(_ sender: Any) {
        showImagePicker()
    }
    
    @IBAction func portraitButtonClicked(_ sender: Any) {
        showImagePicker()
    }
    
    
}
