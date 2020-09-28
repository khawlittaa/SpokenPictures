//
//  ChooseLayoutViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/16/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class ChooseLayoutViewController: UIViewController {
    @IBOutlet weak var layoutsCollectionView: UICollectionView!
    
    let layoutsVM = ChooseLayoutViewModel()
    var createAlbumVM: ?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        showAnimate()
    }
    
    func setUpCollectionView(){
        layoutsCollectionView.dataSource = self
        layoutsCollectionView.delegate = self
        layoutsCollectionView.registerCell(nib: "LayoutCollectionViewCell", cellreuseIdentifier: "LayoutCollectionViewCell")
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
    @IBAction func closezButtonClicked(_ sender: Any) {
        removeAnimate()
    }
    
    
}

extension ChooseLayoutViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let page = AlbumPageLayout1Item()
            createAlbumVM?.pages.append(page)
            removeAnimate()
        case 1:
            let page = AlbumPageLayout2Item()
            createAlbumVM?.pages.append(page)
            removeAnimate()
        case 2:
            let page = AlbumPageLayout3Item()
            createAlbumVM?.pages.append(page)
            removeAnimate()
        case 3:
            let page = AlbumPageLayout4Item()
            createAlbumVM?.pages.append(page)
            removeAnimate()
        case 4:
            let page = AlbumPageLayout5Item()
            createAlbumVM?.pages.append(page)
            removeAnimate()
        case 5:
            let page = AlbumPageLayout6Item()
            createAlbumVM?.pages.append(page)
            removeAnimate()
        default:
            print("error selcting layout")
        }
        print("selected layout \(indexPath.row) ")
    }
}

extension ChooseLayoutViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return layoutsVM.layouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LayoutCollectionViewCell", for: indexPath) as! LayoutCollectionViewCell
        cell.setLayoutUI(layout: layoutsVM.layouts[indexPath.row])
        return cell
    }
}
