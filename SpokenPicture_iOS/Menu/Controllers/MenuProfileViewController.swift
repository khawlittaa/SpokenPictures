//
//  MenuProfileViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/15/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit
import iOSDropDown
import RxSwift
import RxCocoa

class MenuProfileViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var subtitleDropDown: DropDown!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    let profileVM = ProfileViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackgrouudImage(imageName: "background_menu")
        setUpBinding()
        setsubtitleList()
        setButtonApperance()
    }
    
    func setButtonApperance(){
        saveButton.roundEdges()
    }
    
    func setUpBinding(){
        self.emailTextField.rx.text.orEmpty
            .bind(to: self.profileVM.emailAddress)
            .disposed(by: self.disposeBag)
        
        self.nameTextField.rx.text.orEmpty
            .bind(to: self.profileVM.userName)
            .disposed(by: self.disposeBag)
        
        self.subtitleDropDown.rx.text.orEmpty
            .bind(to: self.profileVM.subtitleLanguage)
            .disposed(by: self.disposeBag)
        
        self.profileVM.isValid()
            .bind(to: saveButton.rx.isEnabled)
            .disposed(by: self.disposeBag)
        
        self.profileVM.isValid()
            .map{$0 ? UIColor.accentAccent31Main : UIColor.grey3Disabled}
            .bind(to: saveButton.rx.backgroundColor)
            .disposed(by: self.disposeBag)
    }

    
    func setsubtitleList(){
         subtitleDropDown.optionArray = profileVM.languages
         // The the Closure returns Selected Index and String
         subtitleDropDown.listWillAppear {
             self.subtitleDropDown.textInputView.resignFirstResponder()
             self.subtitleDropDown.endEditing(true)
         }
         
         subtitleDropDown.didSelect{(selectedText , index ,id) in
             print ("Selected String: \(selectedText) \n index: \(index)")
         }
         
     }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
    
    }
    
}
