//
//  AlbumsViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/14/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackgrouudImage(imageName: "background")
    }
    
    
}

extension AlbumsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateMenuCell", for: indexPath)
            return cell
            
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCoverCollectionViewCell", for: indexPath)
            return cell
        }
    }
    
    
}
