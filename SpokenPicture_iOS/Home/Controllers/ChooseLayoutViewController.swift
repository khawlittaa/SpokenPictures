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
