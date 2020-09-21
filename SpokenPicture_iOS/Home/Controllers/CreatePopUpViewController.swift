//
//  CreatePopUpViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/14/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class CreatePopUpViewController: UIViewController {
    @IBOutlet weak var createMenuCollectionView: UICollectionView!
    
    let createPopUpViewModel = CreateMenuPopUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimate()
        setUpColllectionView()
    }
    
    func setUpColllectionView(){
        createMenuCollectionView.dataSource = self
        createMenuCollectionView.delegate = self
        createMenuCollectionView.registerCell(nib: "CreateMenuCell", cellreuseIdentifier: "CreateMenuCell")
    }
    
    @IBAction func closeMenuClicked(_ sender: Any) {
        removeAnimate()
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
    
}

extension CreatePopUpViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let createAlbum = home.instantiateViewController(withIdentifier: "CreateAlbumViewController")
            self.navigationController?.pushViewController(createAlbum, animated: true)
        }
    }
    
}
extension CreatePopUpViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return createPopUpViewModel.titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateMenuCell", for: indexPath)  as! CreateMenuCell
        cell.setUIelements(title: createPopUpViewModel.titles[indexPath.row], imageName: createPopUpViewModel.pictures[indexPath.row])
        return cell
    }
    
    
}
