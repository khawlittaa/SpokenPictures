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

    @IBAction func createButtonClicked(_ sender: Any) {
    }
    
    @IBAction func albumsButtonClicked(_ sender: Any) {
        let albums = home.instantiateViewController(withIdentifier: "AlbumsViewController")
        navigationController?.pushViewController(albums, animated: true)
    }
}
