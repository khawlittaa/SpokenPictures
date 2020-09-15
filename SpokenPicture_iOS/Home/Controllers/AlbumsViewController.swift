//
//  AlbumsViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/14/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myAlbumsCollectionView: UICollectionView!
    
    var bgColor: UIColor = .accentAccent31Main
    var createImgName: String = ""
    var viewTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        self.setBackgrouudImage(imageName: "background")
        titleLabel.text = viewTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUpCollectionView(){
        if let layout = myAlbumsCollectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        myAlbumsCollectionView.dataSource = self
        myAlbumsCollectionView.delegate = self
        myAlbumsCollectionView.registerCell(nib: "CreateAlbumCell", cellreuseIdentifier: "CreateAlbumCell")
        myAlbumsCollectionView.registerCell(nib: "AlbumCoverCollectionViewCell", cellreuseIdentifier: "AlbumCoverCollectionViewCell")
    }
    @IBAction func backbtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension AlbumsViewController: UICollectionViewDelegateFlowLayout, PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 136
        } else {
            return 190
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            return CGSize(width: 136, height: 136)
        }else{
            return CGSize(width: 136, height: 190)
        }
    }
}

extension AlbumsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateAlbumCell", for: indexPath) as! CreateAlbumCell
            cell.setBgImage(imageName: createImgName)
            return cell
            
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCoverCollectionViewCell", for: indexPath) as! AlbumCoverCollectionViewCell
            cell.setBgColor(color: bgColor)
            return cell
        }
    }
    
    
    
}
