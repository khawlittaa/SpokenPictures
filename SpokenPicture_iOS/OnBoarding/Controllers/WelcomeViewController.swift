////
//  WelcomeViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/10/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit
import iOSDropDown

class WelcomeViewController: UIViewController {
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var subtitleDropDown: DropDown!
    
    let welcomeVM = WelcomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setsubtitleList()
        setButtonAppearance()
    }
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         navigationController?.setNavigationBarHidden(true, animated: animated)
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         navigationController?.setNavigationBarHidden(false, animated: animated)
     }
    
    func setButtonAppearance(){
        getStartedButton.isValid = false
        getStartedButton.roundEdges()
    }
    
    func setsubtitleList(){
        subtitleDropDown.optionArray = welcomeVM.languages
         // The the Closure returns Selected Index and String
        subtitleDropDown.listWillAppear {
            self.subtitleDropDown.textInputView.resignFirstResponder()
            self.subtitleDropDown.endEditing(true)
        }
        
         subtitleDropDown.didSelect{(selectedText , index ,id) in
         print ("Selected String: \(selectedText) \n index: \(index)")

            if  self.welcomeVM.ValidateCredentials(){
                self.getStartedButton.isValid = true
               }
         }
       
    }
 
  
}
