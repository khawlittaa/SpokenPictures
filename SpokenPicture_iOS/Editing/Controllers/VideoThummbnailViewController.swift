//
//  VideoThummbnailViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/24/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class VideoThummbnailViewController: UIViewController {

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var thumbnailSuggestionsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        addNavigationBarItem()
    }
    
    func addNavigationBarItem(){
          self.navigationController?.navigationBar.tintColor = .accentBlack1Main
          let continueuttonItem = UIBarButtonItem(title: "Continue", style: .plain, target: self, action: #selector(ContinueTapped))
          self.navigationItem.rightBarButtonItem = continueuttonItem
          
      }
      
      
      @objc func ContinueTapped()  {
          self.navigationController?.popViewController(animated: true)
      }
    
    func setUpCollectionView(){
        thumbnailSuggestionsCollectionView.dataSource = self
        thumbnailSuggestionsCollectionView.delegate = self
        thumbnailSuggestionsCollectionView.registerCell(nib: "ThumbnailSuggestionCollectionViewCell", cellreuseIdentifier: "thumbnailSuggestionCell")
    }
    
    @IBAction func shuffleButtonPressed(_ sender: Any) {
    }
    
}
extension VideoThummbnailViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ThumbnailSuggestionCollectionViewCell
        cell.layer.borderWidth = 6.0
        cell.layer.borderColor = UIColor.accentAccent31Main.cgColor
        self.thumbnailImage.image = cell.thumbnailImagePreview.image
    }
}

extension VideoThummbnailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thumbnailSuggestionCell", for: indexPath)
//        To DO: update cell image from API
        return cell
    }
    
    
}
