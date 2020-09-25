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
        addNavigationBarItemsWithMenu(iscomplete: true)
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
    
    
    @IBAction func landscapeButtonClicked(_ sender: Any) {
            let  landscrapeVC = postcard.instantiateViewController(withIdentifier: "PostCardLayoutVC") as! PostCardLayoutViewController
            landscrapeVC.postCardVm.isLandScape = true
            landscrapeVC.postCardVm.isPortarait = false
            landscrapeVC.isPostcard = postcardVC!.isPostcard
            navigationController?.pushViewController(landscrapeVC, animated: true)
    
    }
    
    @IBAction func portraitButtonClicked(_ sender: Any) {
        
        let portraitVC = postcard.instantiateViewController(withIdentifier: "PostCardLayoutVC") as! PostCardLayoutViewController
        portraitVC.postCardVm.isPortarait = true
        portraitVC.postCardVm.isLandScape = false
        portraitVC.isPostcard = postcardVC!.isPostcard
        navigationController?.pushViewController(portraitVC, animated: true)
        
    }
    
    
}
