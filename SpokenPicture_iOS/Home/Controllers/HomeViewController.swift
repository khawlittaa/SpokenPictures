//
//  HomeViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/14/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var albumsView: UIView!
    @IBOutlet weak var framesView: UIView!
    @IBOutlet weak var postCardView: UIView!
    @IBOutlet weak var createView: UIView!
    @IBOutlet weak var scanView: UIView!
    
    let home = UIStoryboard(name: "Home", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpBAckgoudsforViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         navigationController?.setNavigationBarHidden(true, animated: animated)
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         navigationController?.setNavigationBarHidden(false, animated: animated)
     }
    
    func SetUpBAckgoudsforViews(){
        self.setBackgrouudImage(imageName: "background")
        albumsView.setBackgrouudImage(imageName: "albums_home")
        createView.setBackgrouudImage(imageName: "create_home")
        framesView.setBackgrouudImage(imageName: "frames_home" )
        scanView.setBackgrouudImage(imageName: "scan_home")
        postCardView.setBackgrouudImage(imageName: "postcard_home")
    }
    
    func albumsView(bgColor: UIColor, createImage: String, title: String){
        let albums = home.instantiateViewController(withIdentifier: "AlbumsViewController") as! AlbumsViewController
        albums.bgColor = bgColor
        albums.createImgName = createImage
        albums.viewTitle = title
        navigationController?.pushViewController(albums, animated: true)
    }

    @IBAction func createButtonClicked(_ sender: Any) {
        
        let popUp = home.instantiateViewController(withIdentifier: "CreatePopUpViewController")
        self.navigationController?.pushViewController(popUp, animated: true)
    }
    
    @IBAction func albumsButtonClicked(_ sender: Any) {
        albumsView(bgColor: .accentAccent21Main, createImage: "create_Album", title: "My Albums")
    }
    
    @IBAction func postcardsClicked(_ sender: Any) {
        albumsView(bgColor: .accentAccent11Main, createImage: "create_postCard", title: "My Postcards")
    }
    
    @IBAction func FramesClicked(_ sender: Any) {
        albumsView(bgColor: .pastelPastel22Vivid, createImage: "create_Frame", title: "My Frames")
    }
}
