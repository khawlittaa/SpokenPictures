//
//  PostCardTextEditorViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/23/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PostCardTextEditorViewController: UIViewController {
    
    @IBOutlet weak var numberofCaractersLabel: UILabel!
    @IBOutlet weak var messageTextEditor: UITextView!
    @IBOutlet weak var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlaceHolderText()
        addNavigationBarItemsWithMenu()
    }
    
    func setPlaceHolderText(){
        messageTextEditor.delegate = self
        messageTextEditor.text = "Tap here to type your message… "
        messageTextEditor.textColor = UIColor.lightGray
        numberofCaractersLabel.text = "0/400 Characters"
    }
    
}

// MARK: - UITextViewDelegate
extension PostCardTextEditorViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.accentBlack1Main
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        numberofCaractersLabel.text = "\(textView.text.count)/400 Characters"
        if textView.text.count > 400{
            textView.isEditable = false
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Tap here to type your message… "
            textView.textColor = UIColor.lightGray
        }else{
            let postcardBack = postcard.instantiateViewController(withIdentifier: "PostCardBackLayoutVC") as! PostCardBackLayoutViewController

            postcardBack.postCardVM.postcardNote = textView.text
            navigationController?.pushViewController(postcardBack, animated: false)
        }
    }
}
