//
//  PostcardLandScapeLayoutViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/23/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit
import AVFoundation

class PostCardLayoutViewController: UIViewController {
    
    @IBOutlet weak var audioMessageView: UIView!
    
    @IBOutlet weak var postcardImaheWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var postcardImageHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var postcardLanscapeImage: UIImageView!
    @IBOutlet weak var postcardMainView: UIView!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var addImageButton: UIButton!
    
    var postCardVm = PostsCardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUPLayout()
        addNavigationBarItemsWithMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUPLayout()
    }
    
    func setUpUI()  {
        postcardMainView.addViewShadow()
        postcardMainView.setBackgrouudImage(imageName: "postcardBackground")
        saveButton.roundEdges()
     
    }
    
   func setUPLayout(){
        if postCardVm.isLandScape{
                 postcardImaheWidthConstraint.constant = 325
                 postcardImageHeightConstraint.constant = 248
                 
             }else{
                 if postCardVm.isPortarait{
                     postcardImaheWidthConstraint.constant = 248
                     postcardImageHeightConstraint.constant = 325
                     
                 }
             }
    if let image = postCardVm.postCardimage.finalImage{
        postcardLanscapeImage.image = image
        addImageButton.isHidden = true
    }else{
        addImageButton.isHidden = false
    }
    }
    @IBAction func playAudioMessage(_ sender: Any) {
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        let back = postcard.instantiateViewController(withIdentifier: "PostCardBackLayoutVC") as! PostCardBackLayoutViewController
//        back.postCardVM = self.postCardVm
        navigationController?.pushViewController(back, animated: true)
    }
    
    @IBAction func addImageButtonClicked(_ sender: Any) {
        self.showImagePicker(sourceVm: postCardVm)
    }
}


// MARK:- AVAudioPlayerDelegate used to play audio
extension PostCardLayoutViewController: AVAudioPlayerDelegate{
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("finished playing audio")
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("Error while playing audio \(error!.localizedDescription)")
    }
}
