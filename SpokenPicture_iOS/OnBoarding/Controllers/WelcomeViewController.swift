////
//  WelcomeViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/10/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit
import iOSDropDown
import RxSwift
import RxCocoa

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var subtitleDropDown: DropDown!
    
    let welcomeVM = WelcomeViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setsubtitleList()
        setButtonAppearance()
        setUpBinding()
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
    
    func setUpBinding(){
        self.emailTextField.rx.text.orEmpty
            .bind(to: self.welcomeVM.emailAddress)
            .disposed(by: self.disposeBag)
        
        self.nameTextField.rx.text.orEmpty
            .bind(to: self.welcomeVM.userName)
            .disposed(by: self.disposeBag)
        
        self.welcomeVM.isValid()
            .bind(to: getStartedButton.rx.isEnabled)
            .disposed(by: self.disposeBag)
        
        self.welcomeVM.isValid()
            .map{$0 ? UIColor.accentAccent31Main : UIColor.grey3Disabled}
            .bind(to: getStartedButton.rx.backgroundColor)
            .disposed(by: self.disposeBag)
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
            self.getStartedButton.isValid = true
        }
        
    }
 
    
    @IBAction func getStartedbuttonClicked(_ sender: Any) {
        let user = User(name: nameTextField.text!, email: emailTextField.text!, language: subtitleDropDown.text!)
        let home = UIStoryboard(name: "Home", bundle: nil)
        let homeNav = home.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//        Register user API call here
        homeNav.user = user
        navigationController?.pushViewController(homeNav, animated: true)
    }
}

