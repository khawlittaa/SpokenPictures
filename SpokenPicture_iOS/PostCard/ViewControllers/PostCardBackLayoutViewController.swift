//
//  PostCardBackLayoutViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/23/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PostCardBackLayoutViewController: UIViewController {
    
    var numLetters = 0
    @IBOutlet weak var postcardBackView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var postcardMessagetextView: UITextView!
    
    var postCardVM = PostsCardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setPlaceHolderText()
        addNavigationBarItemsWithMenu()
    }
    
    func setPlaceHolderText(){
        postcardMessagetextView.delegate = self
        if  postCardVM.postcardNote != "" {
            postcardMessagetextView.text = postCardVM.postcardNote
            postcardMessagetextView.textColor = UIColor.accentBlack1Main
        }else{
            postcardMessagetextView.text = "Tap here to type your message… "
            postcardMessagetextView.textColor = UIColor.lightGray
        }
    }
    
    func setUpUI()  {
        postcardBackView.addViewShadow()
        postcardBackView.setBackgrouudImage(imageName: "postcardBackground")
        saveButton.roundEdges()
    }
    
    @IBAction func frontButtonPressed(_ sender: Any) {
    }
    
}

extension PostCardBackLayoutViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
            let editor = postcard.instantiateViewController(withIdentifier: "PostCardTextEditorVC")
            navigationController?.pushViewController(editor, animated: false)
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Tap here to type your message… "
            textView.textColor = UIColor.lightGray
        }
    }
}
