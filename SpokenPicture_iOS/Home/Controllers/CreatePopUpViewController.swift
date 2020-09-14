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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMenuCollectionView.dataSource = self
        
        createMenuCollectionView.registerCell(nib: "CreateMenuCell", cellreuseIdentifier: "CreateMenuCell")
    }
    
    @IBAction func closeMenuClicked(_ sender: Any) {
    }
    
}

extension CreatePopUpViewController: UICollectionViewDelegate{
    
}
extension CreatePopUpViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateMenuCell", for: indexPath) 
        return cell
    }
    
    
}
